# frozen_string_literal: true

class StorePresenter
  def self.present(store)
    {
      id: store.id,
      name: store.name
    }
  end
end
