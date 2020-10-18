Rails.application.routes.draw do

  root to:'products#index'
  # resources :products do
  #   resources :purchases, only: [:index, :create]
  # end
  devise_for :users
  resources :users, only: :show do
    resources :products do
      resources :purchases, only: [:index, :create]
    end
  end
end
