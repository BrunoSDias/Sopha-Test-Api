require 'rails_helper'

RSpec.describe Api::UsersController, type: :routing do
    describe 'routes' do
        context 'testa rota para index' do
            it { should route(:get, '/api/users').to(action: :index, format: :json) }
        end

        context 'testa rota para show' do
            it { should route(:get, '/api/users/1').to(action: :show, id: 1, format: :json) }
        end

        context 'testa rota para create' do
            it { should route(:post, '/api/users').to(action: :create, format: :json) }
        end

        context 'testa rota para update' do
            it { should route(:put, '/api/users/1').to(action: :update, id: 1, format: :json) }
        end

        context 'testa rota para destroy' do
            it { should route(:delete, '/api/users/1').to(action: :destroy, id: 1, format: :json) }
        end
    end
end