Rails.application.routes.draw do
  resources :rooms do
    resources :reviews, only: [:create, :update], module: :rooms
  end
  resources :users

  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destroy]

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
