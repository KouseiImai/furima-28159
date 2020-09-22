Rails.application.routes.draw do

  root to:'products#index'
  resources :products, only: :index

  devise_for :users
end
