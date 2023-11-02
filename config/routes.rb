Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      "users/sessions"
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'homes#index'
  get 'users/account', to: 'users#account'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
