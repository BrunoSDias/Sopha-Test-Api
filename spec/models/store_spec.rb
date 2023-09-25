require 'rails_helper'

RSpec.describe Store, type: :model do

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it {  is_expected.to validate_presence_of(:name) }
    it {  is_expected.to validate_presence_of(:user_id) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  end
end