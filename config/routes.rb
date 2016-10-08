Rails.application.routes.draw do


  get 'users/index' => 'users#index', as: 'users_index'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get 'users/edit'

  get 'users/destroy'

  root to: 'users#index'

  put 'markets/:id/update' => 'markets#update', as:'markets_update'

  get 'markets/index' => 'markets#index', as: 'markets_index'

  get 'markets/new'

  post 'markets/create' => 'markets#create', as: 'markets_create'

  get 'markets/show/:id'  => 'markets#show', as: 'markets_show'

  get 'markets/:id/edit' => 'markets#edit', as: 'markets_edit'

# adding an id to this so that we can edit vendor within market show page.
  get 'vendors/:id/edit' => 'vendors#edit', as: 'vendors_edit'

  get 'vendors/index' => 'vendors#index', as: 'vendors_index'

  get 'vendors/new'

  post 'vendors/create' => 'vendors#create', as:'vendors_create'

  get 'vendors/:id/show'  => 'vendors#show', as:'vendors_show'

  put 'vendors/:id/update' => 'vendors#update', as:'vendors_update'

  delete 'vendors/:id/destroy' => 'vendors#destroy', as: 'vendors_destroy'

  get 'vendors/:id/show_sales_by_month' => 'vendors#show_sales_by_month', as: 'show_sales_by_month'


  put 'products/:id/update' => 'products#update', as:'products_update'

  get 'products/index' => 'products#index', as: 'products_index'

  get 'products/new' => 'products#new', as: 'products_new'

  post 'products/create' => 'products#create', as: 'products_create'

  get 'products/show/:id'  => 'products#show', as: 'products_show'

  get 'products/:id/edit' => 'products#edit', as: 'products_edit'

  delete 'products/:id/delete' => 'products#destroy', as: 'products_delete'



  get 'sales/:vendor_id/:product_id/new' => 'sales#new', as: 'sales_new'

  post 'sales/:vendor_id/:product_id/create' => 'sales#create', as: 'sales_create'

  # resources :vendors do
  #   resources :products
  #   resources :sales
  # end


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
