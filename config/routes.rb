Rails.application.routes.draw do
  resources :transactions
  resources :items
  resources :storefronts, only:[:show, :edit]
  resources :users
  
  root 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
