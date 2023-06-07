Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "application#welcome"

  get "/merchants/:id/dashboard", to: "merchants#show"

  resources :merchants, except: [:index, :show, :edit, :destroy, :new, :create, :update] do
    resources :invoices, only: [:index, :show], controller: "merchant/invoices"
  end

  resources :admin, only: [:index]
  namespace :admin do
    resources :merchants, only: [:index, :show, :edit, :update, :new, :create]
    resources :invoices, only: [:index, :show]
  end
end
