# frozen_string_literal: true

class UserSerializer
  def initialize(user)
    @user = User.select(:id, :name, :email).find_by_email(user.email)
  end

  def serialize
    {
      id: user.id,
      name: user.name,
      email: user.email
    }
  end

  attr_reader :user
end
