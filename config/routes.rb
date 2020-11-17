Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :concept, only: :index
  resources :posts do 
    collection do
      get 'search'
    end
  end
end