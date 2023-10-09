# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it 'name presence' do
      should validate_presence_of(:name)
    end
  end

  describe 'valid store' do
    let!(:user) { User.create(name: 'Test Store', email: 'test@test.com', password: 'password') }
    it 'create a new store' do
      store = user.stores.create(name: 'Test Store')

      expect(store).to be_valid

      expect(Store.find(store.id)).to eq(store)
    end
  end
end