module Api
  module V1
    class StoresController < ApplicationController
      before_action :authenticate_user!
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
        @store.user = current_user

        if @store.save
          render json: @store, status: :created
        else
          render json: { errors: @store.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @store.update(store_params)
          @store.user = current_user
          render json: @store, status: :ok
        else
          render json: { errors: @store.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @store.destroy
          render json: { message: "Store was successfully destroyed" }, status: :ok
        else
          render json: { errors: ["Failed to destroy store"] }, status: :unprocessable_entity
        end
      end

      private

      def set_store
        @store = Store.find(params[:id])
      end

      def store_params
        params.require(:store).permit(:name)
      end
    end
  end
end
