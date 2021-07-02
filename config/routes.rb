Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: :show 
  
  post 'like/:article_id', to: 'likes#like', as: 'like'
  delete 'like/:article_id', to: 'likes#unlike', as: 'unlike'
end
