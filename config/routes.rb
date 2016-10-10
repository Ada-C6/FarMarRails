Rails.application.routes.draw do
  root to: 'sessions#index'

  # Session controller routes

  get 'sessions/index'

  get 'sessions/new'

  post 'sessions/create' => 'sessions#create'

  delete 'sessions/destroy'

  # User controller routes

  get 'users/index' => 'users#index'

  get 'users/show/:id' => "users#show", as: "users_show"

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  # Sales controller routes

  get 'sales/index'

  get 'sales/show'

  get 'sales/new'

  post 'sales/create'

  get 'sales/:id/edit' => 'sales#edit'

  put 'sales/:id/update' => 'sales#update'

  delete 'sales/:id/destroy' => 'sales#destroy'

  # Product controller routes

  get 'products/index'

  get 'products/show/:id' => 'products#show', as: 'products_show'

  get 'products/new'

  post 'products/create'

  get 'products/:id/edit' => 'products#edit', as: 'products_edit'

  put 'products/:id/update' => 'products#update', as: 'products_update'

  delete 'products/:id/destroy' => 'products#destroy', as: 'products_destroy'

  # Vendors controller routes

  get 'vendors/index'

  get 'vendors/show'

  get 'vendors/new' => 'vendors#new', as: 'new_vendor'

  post 'vendors/create'

  get 'vendors/:id/edit' => 'vendors#edit', as: 'vendors_edit'

  patch 'vendors/:id/update' => 'vendors#update', as: 'vendors_update'

  delete 'vendors/:id/destroy' => 'vendors#destroy', as: 'vendors_destroy'

  # Market controller routes

  get 'markets/index'

  get 'markets/show/:id' => 'markets#show', as: 'markets_show'

  get 'markets/new'

  post 'markets/create'

  get 'markets/:id/edit'  => 'markets#edit', as: 'markets_edit'

  put 'markets/:id/update' => 'markets#update', as: 'markets_update'

  delete 'markets/:id/destroy' => 'markets#destroy', as: 'markets_destroy'

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
