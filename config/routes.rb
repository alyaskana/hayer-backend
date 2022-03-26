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

  resources :posts, defaults: { format: :json }
  resources :users, defaults: { format: :json } do
    collection do
      get :profile
    end
  end
  resources :users, defaults: { format: :json }
  resources :responses, defaults: { format: :json }
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
