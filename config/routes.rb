Rails.application.routes.draw do
  devise_for :users
  root 'splash_screens#index'

  authenticated :user do
    resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :transactions
    resources :splash_screens
  end
    get 'users/sign_in' => 'devise/sessions#new'
    get '/categories', to: 'categories#index'
    get '/transactions', to: 'transactions#index'
end
