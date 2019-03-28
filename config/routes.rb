Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :products
    resources :product_categories

    root to: 'products#index'
  end
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :product_categories
      resources :products
    end
  end
end
