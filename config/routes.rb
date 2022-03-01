Rails.application.routes.draw do
  devise_for :users
  resources :dashboard, only: [:index] 
  resources :home, only: [:index]
  root "home#index"
end
