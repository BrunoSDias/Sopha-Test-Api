require 'rails_helper'

RSpec.describe Api::StoresController, type: :routing do
    describe 'routes' do
        context 'testa rota para index' do
            it { should route(:get, '/api/stores').to(action: :index, format: :json) }
        end

        context 'testa rota para show' do
            it { should route(:get, '/api/stores/1').to(action: :show, id: 1, format: :json) }
        end

        context 'testa rota para create' do
            it { should route(:post, '/api/stores').to(action: :create, format: :json) }
        end

        context 'testa rota para update' do
            it { should route(:put, '/api/stores/1').to(action: :update, id: 1, format: :json) }
        end

        context 'testa rota para destroy' do
            it { should route(:delete, '/api/stores/1').to(action: :destroy, id: 1, format: :json) }
        end
    end
end