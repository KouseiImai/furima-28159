Rails.application.routes.draw do

  root to:'products#index'
  resources :products

  devise_for :users
  resources :users, only: :show
end
