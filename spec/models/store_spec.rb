require 'rails_helper'

RSpec.describe Store, type: :model do
  subject(:store) { build :store }

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
