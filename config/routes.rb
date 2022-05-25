Rails.application.routes.draw do

  ExceptionHunter.routes(self)

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :status, to: 'api#status'

      devise_scope :user do
        resource :user, only: %i[update show]
      end
    end
  end

  devise_for  :users,
              defaults: {
                format: :json
              },
              path: 'api/v1/users',
              controllers: {
                sessions: 'api/v1/sessions',
                registrations: 'api/v1/registrations',
                confirmations: 'api/v1/confirmations',
                passwords: 'api/v1/passwords'
              }
end
