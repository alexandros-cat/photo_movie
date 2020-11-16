Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :posts do
    resources :concept
    collection do
      get 'search'
    end
  end
end