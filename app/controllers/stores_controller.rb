class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stores, only: [:index]
  before_action :set_store, only: [:delete, :update]

  def index #get request
    render json: @store
  end

  def create #post request
    @store = Store.new(store_params)

    return render json: @store if @store.save
    return render json: @store.errors
  end

  def update #patch request
    @store.update_attributes(name: params[:new_name])
    
    render json: @store
  end

  def delete #delete request
    return render json: {result: "Store not found"}, status: 404 unless @store.present?

    @store.destroy 

    render json: @store
  end

  private
    def store_params
      params.require(:store).permit(:name).merge(user_id: current_user.id)
    end

    def set_stores
      @store = Store.where(user_id: current_user.id)
    end

    def set_store
      @store = Store.find_by(store_params)
    end
end