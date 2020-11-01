Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "tweets#index"
  resources :tweets do
    resources :comments, only: [:create, :destroy]
    resources :keep_it_ups, only: [:create, :destroy]
    get "search", on: :collection
    get "search", on: :member
  end
  resources :tags, only: :show
end
