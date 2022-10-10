class StoresController < ApplicationController
  before_action :store, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create show update destroy]

  def create
    store = Store.new(store_params)

    if store.save
      render json: store,
             serializer: Store::Create::StoresSerializer,
             status: :created
    else
      render json: { errors: store.errors.messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: store,
           serializer: Store::Show::StoresSerializer,
           status: :ok
  end

  def update
    store.update(store_params)

    head :no_content
  end

  def destroy
    store.destroy

    head :no_content
  end

  private

  def store_params
    params.require(:store).permit(:name, :user_id)
  end

  def store
    store = Store.find(params[:id])
  end
end
