Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               registrations: 'users/registrations',
               sessions: 'users/sessions'
             }

  namespace :api, defaults: { format: 'json' } do
    resources :posts do
      collection do
        get :latest_responses
        get :my_latest_responses
        get :favorites
      end
      member do
        post :favorite
      end
    end
    resources :users do
      collection do
        get :profile
      end

      member do
        post :verify_email
        post :complete_signup
      end
    end
    resources :responses
  end
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
