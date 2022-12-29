require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'scopes' do
        describe 'search_user' do
            it 'retorna usuário com nome igual ao parâmetro' do
                user = create :user
                expect(User.search_user(user.name).count).to eq(1)
            end

            it 'retorna usuário com nome semelhante ao parâmetro' do
                user = create :user
                expect(User.search_user(user.name[0..2]).count).to eq(1)
            end

            it 'retorna usuário com nome diferente do parâmetro' do
                user = create :user
                expect(User.search_user('nome').count).to eq(0)
            end

            it 'retorna todos os usuários' do
                user = create :user
                expect(User.search_user('').count).to eq(1)
            end
        end

        describe 'order_user_by_name' do
            it 'retorna usuários ordenados por nome' do
                user1 = User.create name: "Alberto", email: Faker::Internet.email, password: "123456", password_confirmation: "123456"
                user2 = User.create name: "Walter", email: Faker::Internet.email, password: "123456", password_confirmation: "123456"
                expect(User.order_user_by_name.first).to eq(user1)
            end
        end
    end

    describe 'associations' do
        it { should have_many(:stores).dependent(:destroy) }
    end

    describe 'validations' do
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password) }
    end

    describe 'callbacks' do
        context 'before_validation' do
            it 'seta UID igual ao email do usuário' do
                user = User.new attributes_for :user_without_uid
                expect(user.uid).to eq('')
                user.save
                expect(user.uid).to eq(user.email)
            end

            it 'seta provider igual a email' do
                user = User.new attributes_for :user
                expect(user.provider).to eq('email')
            end
        end
    end
end