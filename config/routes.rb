Rails.application.routes.draw do
  root to: "front#index"

  devise_for :users

  resources :users, only: [:index, :show]
end
