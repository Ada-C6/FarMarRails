Rails.application.routes.draw do

root to: 'homes#index'

  get 'homes/markets_index' => 'homes#markets_index', as: 'markets_index'

  get 'homes/markets_show/:id' => 'homes#markets_show', as: 'markets_show'

  get 'sales/new'

  get 'sales/create'

  get 'sales/update'

  get 'sales/edit'

  get 'sales/destroy'

  get 'sales/show'

  get 'sales/index'

  get 'products/:id/new' => 'products#new', as: 'new_product_for_vendor'

  post 'products/:id/create' => 'products#create'

  put 'products/update/:id' => 'products#update', as: 'update_product'

  get 'products/edit/:id' => 'products#edit', as: 'edit_product'

  delete 'products/destroy/:id' => 'products#destroy', as: 'delete_product'

  get 'products/:id/show' => 'products#show', as: 'show_product'

  get 'products/index'

  get 'market/:id/vendors/new' => 'vendors#new', as: 'vendors_new'

  post 'market/:id/vendors/create' => 'vendors#create', as: 'vendors_create'

  put 'vendors/:id/update' => 'vendors#update', as: 'vendors_update'

  get 'vendors/:id/edit' => 'vendors#edit', as: 'vendors_edit'

  delete 'vendors/:id/destroy' => 'vendors#destroy', as: 'vendors_destroy'

  get 'vendors/show/:id' => 'vendors#show', as: 'show_vendor'

  get 'vendors/index' => 'vendors#index', as: 'vendors_home'

  get 'markets/new' => 'markets#new', as: 'markets_new'

  post 'markets/create' => 'markets#create', as: 'markets_create'

  put 'markets/:id/update' => 'markets#update', as: 'markets_update'

  get 'markets/:id/edit' => 'markets#edit', as: 'markets_edit'

  get 'markets/destroy'

  get 'markets/:id/show' => 'markets#show', as: 'show_market'

  get 'markets/index' => 'markets#index', as: 'markets_home'

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
