Rails.application.routes.draw do
  devise_for :users

  root to: 'projects#index', via: :get

  authenticate :user do
    resources :users, only: %i(index show)
    resources :projects, only: %i(index show new create edit update)
  end
end
