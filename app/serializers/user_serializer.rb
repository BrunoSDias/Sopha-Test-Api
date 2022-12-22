class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :encrypted_password
end
