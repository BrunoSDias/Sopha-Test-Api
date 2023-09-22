require 'rails_helper'

RSpec.describe DeviseTokenAuth::ConfirmationsController, type: :routing do
  it { should route(:post, 'api/auth/confirmation').to(action: :create, format: :json) }
  it { should route(:get, 'api/auth/confirmation').to(action: :show, format: :json) }
end