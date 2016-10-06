Rails.application.routes.draw do
  
  root to: 'landing#index'

  get 'landing/index' => 'landing#index'

  root to: 'landing#index'

  get 'vendors/index' => 'vendors#index', as: 'vendor_index'

  get 'vendors/show_vendor/:id' => 'vendors#show_vendor', as: 'show_vendor'

  get 'vendors/:id/new_product' => 'vendors#new_product', as: 'new_product'

  get 'vendors/create_product' => 'vendors#create_product'

  post 'vendors/:id/create_product' => 'vendors#create_product', as: 'create_product'

  get 'vendors/:id/show_product/:product_id' => 'vendors#show_product', as: 'show_product'

  get 'vendors/show_all_products' => 'vendors#show_all_products', as: 'show_all_products'


  get 'vendors/:id/update_product/:product_id' => 'vendors#update_product'

  get 'vendors/:id/edit_product/:product_id' => 'vendors#edit_product', as: 'edit_product'

  put 'vendors/:id/update_product/:product_id' => 'vendors#update_product', as: 'update_product'



  delete 'vendors/destroy_product' => 'vendors#destroy_product', as: 'destroy_product'

  get 'vendors/new_sale' => 'vendors#new_sale'

  get 'vendors/:id/products/:id/create_sale' => 'vendors#create_sale'

  post 'vendors/:id/products/:id/create_sale' => 'vendors#create_sale', as: 'vendor_create_sale'

  get 'vendors/:id/products/:show_sale' => 'vendors#show_sale'

  get 'vendors/show_all_sales' => 'vendors#show_all_sales'

  get 'vendors/total_sales' => 'vendors#total_sales'



  # root to: 'markets#index'

  get 'markets/index' => 'markets#index', as: 'market_index'

  get 'markets/show/:id' => 'markets#show', as: 'market_show'

  get 'markets/new' => 'markets#new', as: 'market_new'

  post 'markets/create' => 'markets#create', as: 'market_create'

  get 'markets/:id/edit' => 'markets#edit', as: 'market_edit'

  put 'markets/:id/update' => 'markets#update', as: 'market_update'

  delete 'markets/:id/destroy' => 'markets#destroy', as: 'market_destroy'

  get 'markets/:id/vendor_index' => 'markets#vendor_index', as: 'market_vendor_index'

  get 'markets/:id/vendor_show/:vendor_id' => 'markets#vendor_show', as: 'market_vendor_show'

  get 'markets/:id/vendor_new'  => 'markets#vendor_new', as: 'market_vendor_new'

  post 'markets/:id/vendor_create' => 'markets#vendor_create', as: 'market_vendor_create'

  get 'markets/:id/:vendor_id/vendor_edit' => 'markets#vendor_edit', as: 'market_vendor_edit'

  put 'markets/:id/:vendor_id/vendor_update' => 'markets#vendor_update', as: 'market_vendor_update'

  delete 'markets/:id/:vendor_id/vendor_destroy' => 'markets#vendor_destroy', as: 'market_vendor_destroy'


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
