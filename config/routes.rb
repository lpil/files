Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#show', via: :get

  authenticate :user do
    resources :users, only: %i(index show)
    resources :projects, only: %i(index)
  end
end
