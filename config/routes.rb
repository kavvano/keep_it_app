Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets do
    resources :comments, only: [:create, :destroy]
    resources :keep_it_ups, only: [:create, :destroy]
    collection do
      get "search"
    end
  end
end
