require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user' do
    # use factories to build objects
    let(:user) { build_stubbed(:user) }

    # Validation of presence
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end

  context 'with attributes' do
    # use factories to build objects
    let(:user) { build_stubbed(:user) }

    # Validation of presence
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :password_digest }
  end

  context 'with associations' do
    # use factories to build objects
    let(:user) { build_stubbed(:user) }

    # Validation of presence
    it { is_expected.to have_many(:stores) }
  end
end
