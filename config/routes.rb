Rails.application.routes.draw do

  root 'home#index'
  resources :home, only: [:index] do
      resources :markets, only: [:index, :show] do
          resources :vendors, only: [:index]
      end
  end

  resources :markets, except: [:destroy] do
      resources :vendors, except: [:show]
  end

  resources :vendors, only: [:index, :show] do
      resources :products, except: [:show] do
          resources :sales, only: [:new]
      end
      resources :sales, only: [:index]
  end

  # get 'markets' => 'markets#index'
  # get 'markets/new' => 'markets#new'
  # post 'markets' => 'markets#create'
  #
  # get 'markets/:id' => 'markets#show', as: 'market'
  #
  # get 'markets/:id/edit' => 'markets#edit', as: 'markets_edit'
  # patch 'markets/:id' => 'markets#update'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
