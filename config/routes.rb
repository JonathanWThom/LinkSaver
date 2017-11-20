Rails.application.routes.draw do
  root "home#index"
  resources :links, only: [:index, :create, :destroy]
  get "featured", to: "featured_links#index"
  patch "delete_links", to: "users/user_link_deletion_settings#update"
end
