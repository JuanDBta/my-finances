# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb

  get 'myfinances', to: 'categories#splash', as: :myfinances
  resources :categories, only: [:index, :new, :create]

  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  
  unauthenticated do
    root to: 'categories#splash', as: :unauthenticated_root
  end

  devise_for :users
  

  

end
