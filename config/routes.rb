Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] 
  resources :transactions, only:[:new, :create, :index, :show]

  resources :storefronts, only:[:new, :show, :edit, :create, :update] do
    resources :items, only:[:show, :edit, :new] 
  end
  resources :items, only:[ :create, :destroy, :update]
  resources :users, only: [:new, :edit, :create, :update]
  
  root to: 'storefronts#index'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#logout'
  get '/cart' => 'transactions#cart'
  get '/superstores' => 'storefronts#superstores'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/add_balance' =>'users#add_balance'
  post '/add_item/:id' => 'transactions#add_item'
  post '/remove_item/:id' => 'transactions#remove_item'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 