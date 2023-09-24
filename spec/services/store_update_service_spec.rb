# spec/services/store_update_service_spec.rb
require 'rails_helper'

RSpec.describe StoreUpdateService do
  let(:user) { create(:user) }
  let(:store) { create(:store, user: user) }
  let(:valid_params) { { name: 'Updated Store' } }
  let(:invalid_params) { { name: '' } }

  describe '#update' do
    context 'when valid params' do
      it 'returns success: true and updates the store' do
        service = StoreUpdateService.new(store, valid_params)
        result = service.update

        expect(result[:success]).to be true
        expect(result[:store].name).to eq 'Updated Store'
      end
    end

    context 'when invalid params' do
      it 'returns success: false and does not update the store' do
        service = StoreUpdateService.new(store, invalid_params)
        result = service.update

        expect(result[:success]).to be false
        expect(result[:error]).to include("can't be blank")
      end
    end
  end
end
