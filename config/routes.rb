Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: :show 
  resources :likes, only: [:create, :destroy]
end
