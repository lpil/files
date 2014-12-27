Rails.application.routes.draw do
  resources :projects

  devise_for :users

  root to: 'users#index'

  resources :users, only: %i(index show)
end
