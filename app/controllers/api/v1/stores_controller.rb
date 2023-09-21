class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: %i[show update destroy]

  def index
    @stores = Store.all

    render json: @stores
  end

  def show
    render json: @store
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      render json: @store, status: :created, location: api_store_url(@store)
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  def update
    if @store.update(store_params)
      render json: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @store.destroy
  end

  private
  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name)
  end
end
