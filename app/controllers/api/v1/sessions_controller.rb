module Api
  module V1
    class SessionsController < Devise::SessionsController
      protect_from_forgery with: :exception, unless: :json_request?
      respond_to :json
      include Api::Concerns::ActAsApiRequest

      private

      # def resource_params
      #   params.require(:user).permit(:email, :password)
      # end

      def respond_with(resource, _opts = {})
        render 'create', status: :ok, locals: { resource: resource }
      end

      def respond_to_on_destroy
        current_user ? log_out_success : log_out_failure
      end

      def log_out_success
        render json: { message: 'Logged out.' }, status: :ok
      end

      def log_out_failure
        render json: { message: 'Logged out failure.' }, status: :unauthorized
      end
    end
  end
end
