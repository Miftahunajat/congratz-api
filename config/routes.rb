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
      resources :users do
        resources :creatives
      end
      resources :product_categories do
        resources :products
      end
      resources :products
    end
  end
end
