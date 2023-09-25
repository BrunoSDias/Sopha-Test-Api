# frozen_literal_string: true

class StoresController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.stores.empty?
      render json: { message: 'No stores found' }, status: :not_found
    else
      render json: current_user.stores
    end
  end

  def show
    render json: current_user.stores.find(params[:id])
  end

  def create
    store = current_user.stores.create(store_params)

    if store.save
      render json: store, status: :created
    else
      render json: store.errors, status: :unprocessable_entity
    end
  end

  def update
    store = current_user.stores.find_by(id: params[:id])
    if store.update(store_params)
      render json: store, status: :ok
    else
      render json: store.errors, status: :unprocessable_entity
    end
  end

  def destroy
    store = current_user.stores.find_by(id: params[:id])

    if store
      store.destroy
      render json: { message: 'Store deleted' }, status: :ok
    else
      render json: { message: 'Store not found' }, status: :not_found
    end
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end
end