Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'categories#home', as: :authenticated_root
    resources :categories
    resources :transactions
    resources :splash_screens
  end

  unauthenticated do
    root 'splash_screens#index', as: :unauthenticated_root
    get 'users/sign_in', to: 'devise/sessions#new'
  end

  devise_scope :user do
    post 'users/sign_in', to: 'devise/sessions#create'
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end
end
