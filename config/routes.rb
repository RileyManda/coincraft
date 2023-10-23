Rails.application.routes.draw do
  devise_for :users

    authenticated :user do
    root 'transactions#index', as: :authenticated_root
  end

  unauthenticated do
    root 'splash_screens#index'
  end

  resources :categories
  resources :transactions
  resources :splash_screens

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
