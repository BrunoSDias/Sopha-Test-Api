# frozen_string_literal: true

class UserPresenter
  def self.present(user)
    {
      name: user.name,
      email: user.email
    }
  end
end
