Rails.application.routes.draw do
  resources :categories
  resources :transactions
  resources :items
  resources :storefronts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
