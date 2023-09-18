class StoresController < ApplicationController
  before_action :set_store, only: [:show, :update, :destroy]

  def index
    stores = current_user.stores

    render json: stores, status: :ok
  end

  def create
    store = current_user.stores.build(store_params)
    if store.save
      render json: store, status: :created
    else
      render json: { error: store.errors.full_messages.join(',') }, status: :unprocessable_entity
    end
  end

  def show
    render json: @store, status: :ok
  end

  def update
    if @store.update(store_params)
      render json: @store, status: :ok
    else
      render json: { error: @store.errors.full_messages.join(',') }, status: :unprocessable_entity
    end
  end

  def destroy
    @store.destroy
    head :no_content
  end

  private

  def set_store
    @store = current_user.stores.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name)
  end
end
