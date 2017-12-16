Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  resources :profiles
  resources :microposts

  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
end
