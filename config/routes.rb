Rails.application.routes.draw do

  resources :products, only: :index

  devise_for :users
end
