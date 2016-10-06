Rails.application.routes.draw do

  root 'index#index'

  get 'index/index'

  get 'index/show'

  get 'index/new'

  get 'index/create'

  get 'index/edit'

  get 'index/update'

  get 'index/destroy'

  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'

  get 'sales/index'

  get 'sales/show'

  get 'sales/new'

  get 'sales/create'

  get 'sales/edit'

  get 'sales/update'

  get 'sales/destroy'

  get 'vendors/index' => 'vendors#index', as: 'vendor_index'

  get 'vendors/show/:id' => 'vendors#show', as: 'vendor_show'

  get 'vendors/new'

  get 'vendors/:id/edit' => 'vendors#edit', as: 'vendor_edit'

  get 'vendors/create'

  put 'vendors/:id/update' => 'vendors#update', as: 'vendor_update'

  get 'vendors/destroy'

  get 'markets/index' => 'markets#index', as: 'market_index'

  get 'markets/show/:id' => 'markets#show', as: 'market_show'

  get 'markets/new' => 'markets#new', as: 'market_new'

  post 'markets/create' => 'markets#create', as: 'market_create'

  get 'markets/:id/edit' => 'markets#edit', as: 'market_edit'

  put 'markets/:id/update' => 'markets#update', as: 'market_update'

  delete 'markets/:id/destroy' => 'markets#destroy', as: 'market_delete'



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
