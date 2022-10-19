module Api
  module V1
    class StoresController < ApplicationController
      include ActionController::HttpAuthentication::Token
      rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
      before_action :authenticate_user, only: %i[create destroy update show]
      before_action :set_store, only: %i[show destroy update]

      def create
        store = authenticate_user.stores.build(store_params)
        if store.save
          render json: StoreRepresenter.new(store).as_json, status: :created
        else
          render json: store.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: { store: StoreRepresenter.new(@store).as_json }, status: :ok
      end

      def update
        if @store.update(store_params)
          render json: { store: StoreRepresenter.new(@store).as_json }, status: :ok
        else
          render json: { errors: @store.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        Store.find(params[:id]).destroy!

        head :no_content
      end

      private

      def authenticate_user
        token, _options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound, JWT::DecodeError
        render status: :unauthorized
      end

      def set_store
        @store = authenticate_user.stores.find_by!(id: params[:id])
      end

      def store_params
        params.require(:store).permit(:name)
      end

      def not_destroyed
        render json: {}, status: :unprocessable_entity
      end
    end
  end
end
