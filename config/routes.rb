Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create]
  # resources :items do
  #   resources :buys, only: :create
  # end
  # resources :users, only: :show
end
