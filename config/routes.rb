# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb

  get 'myfinances', to: 'categories#splash', as: :myfinances

  root to: 'categories#index', as: :root

  unauthenticated do
    root to: 'categories#splash', as: :unauthenticated_root
  end

  devise_for :users

  resources :categories, only: %i[index new create show destroy] do
    resources :operations, only: %i[new create index show]
  end

  resources :operations, only: [:destroy]
end
