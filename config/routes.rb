Rails.application.routes.draw do
  devise_for :users
  root 'splash_screens#index'

  authenticated :user do
    resources :categories
    resources :transactions
    resources :splash_screens
  end
end