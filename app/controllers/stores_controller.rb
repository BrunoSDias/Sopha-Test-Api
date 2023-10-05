# frozen_string_literal: true

class StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :find_store, only: %i[show update delete]

  def index
    render json: {
      stores: current_user.stores.map { |store| StorePresenter.present(store) }
    }
  end

  def show
    if store
      render json: {
        store: StorePresenter.present(store)
      }
    else
      head :not_found
    end
  end

  def create
    store = current_user.stores.create(permitted_params)

    if store.save
      render json: {
        store: StorePresenter.present(store)
      }, status: :created
    else
      unprocessable_entity
    end
  end

  def update
    if store.update(permitted_params)
      render json: {
        store: StorePresenter.present(store)
      }
    else
      unprocessable_entity
    end
  end

  def destroy
    store = current_user.stores.find_by_id(params[:id])

    if store
      store.destroy
      head :no_content
    else
      head :not_found
    end
  end

  private

  attr_accessor :store

  def unprocessable_entity
    render json: {
      errors: store.errors.full_messages.join(', ')
    }, status: :unprocessable_entity
  end

  def find_store
    @store = current_user.stores.find_by_id(params[:id])
  end

  def permitted_params
    params.permit(:name)
  end
end
