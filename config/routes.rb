Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get "/login", to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  get '/dashboard', to: "users#show"

  resource :cart, only: [:create, :show, :destroy, :update]
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index]
  resources :orders, only: [:index, :create, :show]

  get "/:category_slug", to: "categories#show"

end
