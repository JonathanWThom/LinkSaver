Rails.application.routes.draw do
  resources :links, only: [:index, :create, :destroy]
  get "featured", to: "featured_links#index"
end
