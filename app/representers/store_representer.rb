class StoreRepresenter
  def initialize(store)
    @store = store
  end

  def as_json
    {
      id: store.id,
      name: store.name,
      owner: store.user.name
    }
  end

  private

  attr_reader :store
end
