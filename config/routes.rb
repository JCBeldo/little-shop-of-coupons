Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "application#welcome"
  
  get "/merchants/:id/dashboard", to: "merchants#show"
  
  resources :merchants, only: [:show] do
    resources :items, only: [:index, :show, :edit, :update, :new, :create], controller: "merchants/items"
    resources :invoices, only: [:index, :show], controller: "merchant/invoices"
  end
  
  resources :admin, only: [:index]
  namespace :admin do
    resources :merchants, only: [:index]
    resources :invoices, only: [:index, :show]
  end
end
