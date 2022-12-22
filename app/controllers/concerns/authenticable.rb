module Authenticable
    private

    def authenticable_with_token
        @token ||= request.headers["Authorization"]

        unless valid_token?
            render json: { errors: "Not authenticated" }, status: :unauthorized

        end
    end

    def valid_token?
        @token.present?
    end
end