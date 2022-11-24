Rails.application.routes.draw do
  # get 'items/index'
  # get 'backstore/index'
  # get 'welcome/index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'

  # get 'welcome/index'
  resources :users, only: [:new, :create]
  resources :items
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   #get 'welcome', to: 'sessions#welcome'
   delete 'logout', to:'sessions#destroy'
   root 'sessions#new'
   get 'welcome', to: 'welcome#index'
   get 'backstore', to: 'backstore#index'
   get 'items', to: 'items#index'
   get 'cart', to: 'carts#index'
   post 'addItem', to: 'carts#addItem'
   post 'deleteItem', to: 'carts#deleteItem'
   post 'emptyCart', to: 'carts#emptyCart'
  #root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
