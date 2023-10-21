Rails.application.routes.draw do
  root 'splash_screens#index'
  resources :categories
  resources :transactions
  resources :splash_screens
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
