class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @stores = Store.all
    render json: @stores
  end

  def show
    @store = Store.find(params[:id])
    render json: @store
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Store not found' }, status: :not_found
  end

  def create
    @store = current_user.stores.new(store_params)
    if @store.save
      render json: @store, status: :created
    else
      render json: { errors: @store.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @store = current_user.stores.find(params[:id])
    if @store.update(store_params)
      render json: @store
    else
      render json: { errors: @store.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Store not found' }, status: :not_found
  end

  def destroy
    @store = current_user.stores.find(params[:id])
    @store.destroy
    render json: { message: 'Store deleted' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Store not found' }, status: :not_found
  end

  private

  def store_params
    params.require(:store).permit(:name, :address)
  end
end
