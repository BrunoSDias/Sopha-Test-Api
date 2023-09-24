require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) { build_stubbed(:store) }
  context 'store' do
    it { should validate_presence_of(:name) }
  end

  context 'with attributes' do
    let(:store) { build_stubbed(:store) }

    # Validation of presence
    it { is_expected.to respond_to :name }
  end

  context 'with associations' do
    let(:store) { build_stubbed(:store) }

    # Validation of presence
    it { is_expected.to belong_to(:user) }
  end
end
