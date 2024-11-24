Rails.application.routes.draw do
  get 'home/index'
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:create, :edit, :update, :destroy] do
    collection do
      get :sign_up
      get :sign_in
      post :login
      delete :logout
    end
  end
  get '/users', to: 'users#sign_up'
  root "home#index"

  resources :projects do
    resources :tasks, only: [:create, :destroy, :edit, :update]
  end
end
