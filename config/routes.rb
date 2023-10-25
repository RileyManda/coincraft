Rails.application.routes.draw do
  devise_for :
  root 'splash_screens#index'

  authenticated :user do
    resources :categories
    resources :transactions
    resources :splash_screens
  end
    get 'users/sign_out' => 'devise/sessions#destroy
    get 'users/sign_in'=> 'devise/sessions#new'
end