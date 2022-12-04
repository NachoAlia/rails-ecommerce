Rails.application.routes.draw do
  #devise_for :users
  devise_for :users,
    :controllers => {:registrations => "users/registrations"}
  # get 'items/index'
  # get 'backstore/index'
  # get 'welcome/index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'

  # get 'welcome/index'
  #resources :users, only: [:new, :create]
  resources :items
  resources :orders
   #get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
   #get 'welcome', to: 'sessions#welcome'

   devise_scope :user do
    authenticated  do
      root to: 'welcome#index'
      delete '/logout', to:'devise/sessions#destroy'

    end
    unauthenticated  do
      root 'welcome#guest', as: 'unauthenticated_root'
      #root 'devise/sessions#new', as: 'unauthenticated_root'
    end

  end

   get 'welcome', to: 'welcome#index'
   get 'welcome/guest', to: 'welcome#guest'
   get 'backstore', to: 'backstore#index'
   get 'backstore/orders', to:'backstore#orders'
   get 'items', to: 'items#index'
   get 'cart', to: 'carts#index'
   post 'addItem', to: 'carts#addItem'
   post 'deleteItem', to: 'carts#deleteItem'
   post 'emptyCart', to: 'carts#emptyCart'

   get 'orders', to:'orders#index'
   get 'order/new', to: 'orders#new'
   post '/order/cancel/:id', to: 'orders#cancel', as: 'order_cancel'

   post '/backstore/order_approve/:id', to: 'backstore#order_approve', as: 'order_approve'
   post '/backstore/order_reject/:id', to: 'backstore#order_reject', as: 'order_reject'
  #root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
