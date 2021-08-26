require "sidekiq/web"

Rails.application.routes.draw do
  if Rails.env.development?
    mount Sidekiq::Web => "/sidekiq"
  end

  root "home#index"
  resources :links, only: [:index, :create, :destroy, :show, :update]
  get "featured", to: "featured_links#index"
  patch "delete_links", to: "users/user_link_deletion_settings#update"
  resources :favorite_links, only: [:index, :update]
  resources :tags, only: [:create, :show, :destroy]
  resources :categories, only: [:create]
  post 'auth/login', to: 'authentication#api_authenticate'
  resources :link_searches, only: [:create, :index]
  resources :users, only: [:update, :show] do
    resources :links, only: [:index], path: "", to: "users/public_links#index"
    resources :settings, only: [:index]
  end
  patch "color_modes", to: "color_modes#update"
  get "about", to: "about#index"
end
