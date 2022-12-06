Rails.application.routes.draw do
  devise_for :users,
    :controllers => {:registrations => "users/registrations"}

  devise_scope :user do
    authenticated  do
      root to: 'welcome#index'
      delete '/logout', to:'devise/sessions#destroy'
    end
    unauthenticated  do
      root 'welcome#guest', as: 'unauthenticated_root'
    end
  end

  resources :items
  resources :orders

  get 'welcome', to: 'welcome#index'
  get 'welcome/guest', to: 'welcome#guest'

  get 'items', to: 'items#index'
  get 'cart', to: 'carts#index'
  post 'addItem', to: 'carts#addItem'
  post 'deleteItem', to: 'carts#deleteItem'
  post 'emptyCart', to: 'carts#emptyCart'

  get 'orders', to:'orders#index'
  get 'order/new', to: 'orders#new'
  post '/order/cancel/:id', to: 'orders#cancel', as: 'order_cancel'

  get 'backstore', to: 'backstore#index'
  get 'backstore/orders', to:'backstore#orders'
  post '/backstore/order_approve/:id', to: 'backstore#order_approve', as: 'order_approve'
  post '/backstore/order_reject/:id', to: 'backstore#order_reject', as: 'order_reject'

end
