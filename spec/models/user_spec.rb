require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:stores) }
  end

  describe "before_validation" do
    it "sets uid to email if uid is blank and email is present" do
      user = build(:user, uid: nil, email: "test@example.com")

      user.valid?

      expect(user.uid).to eq("test@example.com")
    end

    it "does not set uid if uid is present" do
      user = build(:user, uid: "custom_uid", email: "test@example.com")

      user.valid?

      expect(user.uid).to eq("custom_uid")
    end

    it "does not set uid if email is blank" do
      user = build(:user, uid: nil, email: nil)

      user.valid?

      expect(user.uid).to be_nil
    end
  end
end
