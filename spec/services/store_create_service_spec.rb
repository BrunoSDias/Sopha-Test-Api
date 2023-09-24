# spec/services/store_create_service_spec.rb
require 'rails_helper'

RSpec.describe StoreCreateService do
  let(:user) { create(:user) }
  let(:valid_params) { { name: 'New Store' } }
  let(:invalid_params) { { name: '' } }

  describe '#create' do
    context 'when valid params' do
      it 'returns success: true' do
        service = StoreCreateService.new(user, valid_params)
        result = service.create

        expect(result[:success]).to be true
        expect(result[:store]).to be_persisted
      end
    end

    context 'when invalid params' do
      it 'returns success: false' do
        service = StoreCreateService.new(user, invalid_params)
        result = service.create

        expect(result[:success]).to be false
        expect(result[:error]).to include("can't be blank")
      end
    end
  end
end
