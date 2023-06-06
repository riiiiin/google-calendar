Rails.application.routes.draw do
  post 'events/create'
  post 'events/destroy'
  post 'events/index'
  post 'events/updateFollow'
  post 'events/createFollow'
  post 'events/edit'
  namespace :api do
    namespace :v1 do
      resources :test, only: %i[index]

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end