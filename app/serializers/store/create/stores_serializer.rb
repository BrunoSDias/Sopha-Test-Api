class Store::Create::StoresSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
end
