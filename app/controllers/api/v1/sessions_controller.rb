module Api
  module V1
    class SessionsController < Devise::SessionsController
      protect_from_forgery with: :exception, unless: :json_request?
      respond_to :json
      include Api::Concerns::ActAsApiRequest
    end
  end
end
