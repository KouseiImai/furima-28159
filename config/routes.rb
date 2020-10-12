Rails.application.routes.draw do

  root to:'products#index'
  resources :products do
    resources :purchases, only: :index
  end
  devise_for :users
  resources :users, only: :show
end
