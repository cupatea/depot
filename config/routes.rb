Rails.application.routes.draw do
default_url_options :host => "example.com"

  resources :orders
  resources :line_items
  resources :carts
  get 'store/index'
  resources :products do
    get :who_bought, on: :member
  end

  root 'store#index', as: 'store'
end
