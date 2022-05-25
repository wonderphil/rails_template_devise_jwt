module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      protect_from_forgery with: :exception, unless: :json_request?
      respond_to :json
      include Api::Concerns::ActAsApiRequest

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name,
                                     :last_name)
      end
    end
  end
end
