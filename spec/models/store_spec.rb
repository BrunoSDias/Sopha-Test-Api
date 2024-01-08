# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    store = build(:store, user: user)
    expect(store).to be_valid
  end

  it 'is not valid without a name' do
    expect {
      create(:store, user: user, name: nil)
    }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
  end

  it 'is not valid without a user' do
    expect {
      create(:store, user: nil)
    }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: User must exist')
  end
end