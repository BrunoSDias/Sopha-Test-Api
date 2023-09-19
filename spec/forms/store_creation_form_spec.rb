require 'rails_helper'

RSpec.describe StoreCreationForm, type: :model do
  describe '#save' do
    context 'with valid parameters' do
      it 'creates a new store' do
        user = create(:user)
        form = StoreCreationForm.new(user, { name: 'Store Name' })

        expect(form.save).to be true
        expect(user.stores.count).to eq(1)
      end
    end

    context 'with invalid parameters' do
      it 'returns false and does not create a store' do
        user = create(:user)
        form = StoreCreationForm.new(user, { name: '' })

        expect(form.save).to be false
        expect(user.stores.count).to eq(0)
      end
    end
  end
end
