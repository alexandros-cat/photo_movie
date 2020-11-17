Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :concept, only: :index
  resources :posts do 
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end