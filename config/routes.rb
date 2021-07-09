Rails.application.routes.draw do
  resources :transactions
  resources :items
  resources :storefronts, only:[:show, :edit]
  resources :users
  
  root to: 'storefronts#index'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#logout'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/add_balance' =>'users#add_balance'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
