class StoresController < ApplicationController
  before_action :authenticate_user! # Garante que o usuário está autenticado
  before_action :set_store, only: [:show, :update, :destroy]

  def index
    stores = current_user.stores # Paginação pode ser adicionada aqui
    render json: stores, status: :ok
  end

  def create
    store = current_user.stores.build(store_params)
    if store.save
      render json: store, status: :created
    else
      render json: { error: formatted_error_messages(store) }, status: :unprocessable_entity
    end
  end

  def show
    render json: @store, status: :ok
  end

  def update
    if @store.update(store_params)
      render json: @store, status: :ok
    else
      render json: { error: formatted_error_messages(@store) }, status: :unprocessable_entity
    end
  end

  def destroy
    return head :unauthorized unless current_user.present?

    @store.destroy
    head :no_content
  end

  private

  def authenticate_user
    head :unauthorized unless current_user.present?
  end

  def set_store
    @store = current_user.stores.find_by(id: params[:id])

    return store_not_found_message unless @store
  end

  def store_params
    params.require(:store).permit(:name)
  end

  def formatted_error_messages(resource)
    resource.errors.full_messages.join(',')
  end

  def store_not_found_message
    render json: { message: 'The store is not found' }, status: :unprocessable_entity
  end
end
