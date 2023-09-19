class StoreCreateService
  def initialize(current_user, store_params)
    @current_user = current_user
    @store_params = store_params
  end

  def create
    store = @current_user.stores.create(@store_params)

    if store.persisted?
      { success: true, store: store }
    else
      { success: false, error: store.errors.full_messages.join(', ') }
    end
  end
end
