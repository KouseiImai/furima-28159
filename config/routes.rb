Rails.application.routes.draw do

  root to:'products#index'
  resources :products
  resources :purchases, only: :index
  devise_for :users
  resources :users, only: :show
end
