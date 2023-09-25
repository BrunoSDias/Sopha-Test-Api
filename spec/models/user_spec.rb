require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "associations" do
    it { is_expected.to have_many(:stores) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it {  is_expected.to validate_presence_of(:password) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }

    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at). of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

    it { is_expected.to have_db_index(:email).unique(true) }
    it { is_expected.to have_db_index(:reset_password_token).unique(true) }
  end

  describe "Devise" do
    it 'includes :database_authenticatable' do
      expect(user).to respond_to(:email)
    end

    it 'includes :registerable' do
      expect(user).to respond_to(:email)
      expect(user).to respond_to(:password)
    end

    it 'includes :recoverable' do
      expect(user).to respond_to(:send_reset_password_instructions)
    end

    it 'includes :validatable' do
      expect(user).to respond_to(:valid?)
    end

    it 'includes :jwt_authenticatable' do
      expect(user).to respond_to(:jwt_payload)
    end
  end

end