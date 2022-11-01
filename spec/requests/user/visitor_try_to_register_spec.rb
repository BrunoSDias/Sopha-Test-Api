require 'rails_helper'

describe 'User API' do
  context 'POST /api/auth' do
    it 'and got successfully' do
      post '/api/auth',
           params: {
               email: 'testesopha@gmail.com',
               password: '1234567'
           },
           headers: { 'Accept' => 'application/json' }

      expect(response).to have_http_status(200)
      expect(parsed_body[:data][:email]).to eq('testesopha@gmail.com')
      expect(User.count).to eq(1)
      expect(User.last.email).to eq('testesopha@gmail.com')
    end

    it 'and password is to short' do
      post '/api/auth',
           params: {
               email: 'testesopha@gmail.com',
               password: '1'
           },
           headers: { 'Accept' => 'application/json' }
      
      expect(response).to have_http_status(422)
      expect(User.count).to eq(0)
      expect(parsed_body[:errors][:password][0]).to eq('is too short (minimum is 6 characters)')
    end

    it 'and email has already been taken' do
      user = create(:user)

      post '/api/auth',
           params: {
               email: user.email,
               password: '1234567'
           },
           headers: { 'Accept' => 'application/json' }

      expect(response).to have_http_status(422)
      expect(User.count).to eq(1)
      expect(parsed_body[:errors][:email][0]).to eq('has already been taken')
    end

    it 'and got email and password error' do
      user = create(:user)

      post '/api/auth',
           params: {
               email: user.email,
               password: '1'
           },
           headers: { 'Accept' => 'application/json' }

      expect(response).to have_http_status(422)
      expect(User.count).to eq(1)
      expect(parsed_body[:errors][:email][0]).to eq('has already been taken')
      expect(parsed_body[:errors][:password][0]).to eq('is too short (minimum is 6 characters)')
    end
  end
end
