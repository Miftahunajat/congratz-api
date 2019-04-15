Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :products
    resources :product_categories
    resources :creatives

    root to: 'products#index'
  end
  root 'admin/users#index'

  namespace :api do
    namespace :v1 do
      post 'users/check_username', to: 'users#available_username'
      resources :users do
        resources :creatives
        scope module: :users do
          resources :favorites
          resources :products
          resources :carts
          resources :orders
        end
      end
      resources :product_categories do
        scope module: :product_categories do
          resources :products
        end
      end
      resources :products
    end
  end
end
