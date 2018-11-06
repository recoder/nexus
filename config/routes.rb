Rails.application.routes.draw do
  root to: "front#index"

  devise_for :users

  resources :users, only: [:index, :show]

  namespace :tiny do
    get '', to: 'urls#new'
    resources :urls, only: [:index, :create, :show], controller: :urls do
      get 'preview', on: :member
    end
  end

  get '/-:slug', format: false, to: 'tiny/urls#follow', constraints: { slug: /[\w\-]+/ }, as: :follow_tiny
  # get '/\u21db:slug', format: false, to: 'tiny/urls#follow', constraints: { slug: /[\w\-]+/ }, as: :follow_uni_tiny
end
