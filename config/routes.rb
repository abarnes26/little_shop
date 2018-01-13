Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get "/login", to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  get '/dashboard', to: "users#show"
  post '/items/search', to: "items#search"

  resource :cart, only: [:create, :show, :destroy, :update]
  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index]
  resources :orders, only: [:index, :create, :show]

  namespace :admin do
    get '/dashboard', to: "dashboard#index"
    get '/edit', to: "users#edit"
    patch '/edit', to: "users#update"
    get '/analytics-dashboard', to: "analytics#index"
    post '/analytics-dashboard', to: "analytics#index"
    get '/filter', to: "dashboard#index"
    resources :orders, only: [:show, :update]
    resources :items, only: [:index, :new, :create, :edit, :update]
  end

  get "/:category_slug", to: "categories#show"

end
