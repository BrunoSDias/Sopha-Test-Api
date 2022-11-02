class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  ActiveRecord::Base.include_root_in_json = true
end
