Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :concept, only: :index
  resources :posts do 
    member do
      get 'checked'
    end
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end