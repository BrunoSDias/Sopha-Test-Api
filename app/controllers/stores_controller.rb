class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stores, only: [:index]

  def index #get request
    render json: @store
  end

  def create #post request
    @store = Store.create(store_params)

    render json: @store
  end

  def update #patch request
    @store = Store.find_by(store_params)

    @store.update_attributes(name: params[:new_name])
    
    render json: @store
  end

  def delete #delete request
    @store = Store.where(store_params)

    render json: @store.destroy_all
  end

  private
    def store_params
      params.require(:store).permit(:name).merge(user_id: current_user.id)
    end

    def set_stores
      @store = Store.where(user_id: current_user.id)
    end
end