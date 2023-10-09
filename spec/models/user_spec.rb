# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:stores).dependent(:destroy) }
  end

  describe 'validations' do
    it 'name presence' do
      should validate_presence_of(:name)
    end

    it 'email presence' do
      should validate_presence_of(:email)
    end

    it 'requires a valid email format' do
      should allow_value('user@example.com').for(:email)
      should_not allow_value('invalid_email').for(:email)
    end

    it 'password presence' do
      should validate_presence_of(:password)
    end
  end

  describe 'valid user' do
    it 'create a new user' do
      user = User.create(name: 'Test', email: 'test@test.com', password: 'password')

      expect(user).to be_valid

      expect(User.find(user.id)).to eq(user)
    end
  end
end