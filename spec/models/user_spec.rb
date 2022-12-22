require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'Kanamy', email: 'kanamystewart@gmail.com', password: '123456') }

    describe 'validations' do
        context 'valida de o nome está presente' do
            it { should validate_presence_of(:name) }
        end

        context 'valida se o email está presente' do
            it { should validate_presence_of(:email) }
        end

        context 'valida se o password está presente' do
            it { should validate_presence_of(:password) }
        end

        context 'valida se o email é unico cadastrado' do
            it { should validate_uniqueness_of(:email) }
        end
    end

    describe 'scopes' do
        context 'verifica se tem algum usuário com o nome vindo por params' do
            it '.search_user' do
                user = User.create(name: 'Kanamy', email: 'kanamystewart@gmail.com', password:  '123456')
                expect(User.search_user('Kan')).to include(user)
            end
        end

        context 'verifica se o usuário está sendo ordenado por nome' do
            it '.order_user_by_name' do
                expect(User.order(:name).to_sql).to eq User.order_user_by_name.to_sql
            end
        end
    end
end