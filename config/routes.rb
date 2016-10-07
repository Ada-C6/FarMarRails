Rails.application.routes.draw do

  root to: 'users#index'
  get 'users/index', as: 'index'

  get 'users/show/:type/' => 'users#show', as: "show_users"

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'sales/index/:id' => 'sales#index', as: 'index_sales'

  get 'sales/show/:id' => 'sales#show', as: 'show_sales'

  get 'sales/:vendor_id/new' => 'sales#new', as: 'new_sales'

  post 'sales/:vendor_id/create' => 'sales#create', as: 'create_sales'

  get 'sales/edit'

  get 'sales/update'

  get 'sales/destroy'

  get 'products/index/:id' => 'products#index', as: 'index_products'

  get 'products/show/:id' => 'products#show', as: 'show_products'

  get 'products/:vendor_id/new' => 'products#new', as: 'new_products'

  post 'products/:vendor_id/create' => 'products#create', as: 'create_products'

  get 'products/:id/:vendor_id/edit' => 'products#edit', as: 'edit_products'

  patch 'products/:id/:vendor_id/update' => 'products#update', as: 'update_products'

  delete 'products/destroy' => 'products#destroy', as: 'delete_products'

  get 'vendors/index/:id' => 'vendors#index', as: 'index_vendors'

  get 'vendors/show/:id' => 'vendors#show', as: 'show_vendors'

  get 'vendors/:market_id/new' => 'vendors#new', as: 'new_vendors'

  post 'vendors/:market_id/create/' => 'vendors#create', as: 'create_vendors'

  get 'vendors/:id/:market_id/edit' => 'vendors#edit', as: 'edit_vendors'

  patch 'vendors/:id/:market_id/update' => 'vendors#update', as: 'update_vendors'

  delete 'vendors/destroy' => 'vendors#destroy', as: 'delete_vendors'

  get 'markets/index' => 'markets#index', as: 'index_markets'

  get 'markets/show/:id/:type' => 'markets#show', as: 'show_markets'

  get 'markets/new' => 'markets#new', as: 'new_markets'

  post 'markets/create' => 'markets#create', as: 'create_markets'

  get 'markets/:id/edit' => 'markets#edit', as: 'edit_markets'

  patch 'markets/:id/update' => 'markets#update', as: 'update_markets'

  delete 'markets/destroy' => 'markets#destroy', as: 'delete_markets'

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
