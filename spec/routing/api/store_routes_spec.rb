require 'rails_helper'

RSpec.describe Api::V1::StoresController, type: :routing do
    describe 'routing' do
        it { should route(:get, 'api/stores').to(action: :index, format: :json) }
        it { should route(:get, 'api/stores/1').to(action: :show, id: 1, format: :json) }
        it { should route(:post, 'api/stores').to(action: :create, format: :json) }
        it { should route(:put, 'api/stores/1').to(action: :update, id: 1, format: :json) }
        it { should route(:delete, 'api/stores/1').to(action: :destroy, id: 1, format: :json) }
    end
end