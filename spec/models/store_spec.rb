require 'rails_helper'

RSpec.describe Store, type: :model do
    subject { User.new(name: 'Kanamy', email: 'kanamystewart@gmail.com', password: '123456') }
    subject { Store.new(name: 'Catalogo', user_id: 1) }

    describe 'validations' do
        context 'valida se o user_id está presente' do
            it { should validate_presence_of(:user_id) }
        end
    end

    describe 'scopes' do
        context 'verifica se tem algum catalogo com o nome vindo por params' do
            it '.search_store' do
                user = User.create(name: 'Kanamy', email: 'kanamydamiao@gmail.com', password:'123456')
                store = Store.create(name: 'Catalogo', user_id: user.id)
                expect(Store.search_store('Catal')).to include(store)
            end
        end

        context 'verifica se o catalogo está sendo ordenada por nome' do
            it '.order_store_by_name' do
                expect(Store.order(:name).to_sql).to eq Store.order_store_by_name.to_sql
            end
        end
    end

    describe 'associations' do
        context 'verifica se o catalogo pertence a um usuário' do
            it { should belong_to(:user) }
        end
    end
end