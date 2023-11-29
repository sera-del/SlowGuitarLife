Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/sign_out',       to: 'devise/sessions#destroy'
    post 'users/guest_sign_in',  to: 'users/sessions#guest_sign_in'
  end

  get 'users/account',    to: 'users#account'
  get 'users/check',      to: 'users#check'
  patch 'users/withdraw', to: 'users#withdraw'

  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
