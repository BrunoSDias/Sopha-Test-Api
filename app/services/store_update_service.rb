class StoreUpdateService
  def initialize(store, store_params)
    @store_params = store_params
    @store = store
  end

  def update
    if @store.update(@store_params)
      { success: true, store: @store }
    else
      { success: false, error: @store.errors.full_messages.join(', ') }
    end
  end
end
