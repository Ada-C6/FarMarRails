Rails.application.routes.draw do

  # root to: 'markets#index'

  root to: 'vendors#index'

  get 'products/index'





  get 'markets/index' => 'markets#index', as: 'markets_index'

  get 'markets/new'

  get 'markets/create'

  get 'markets/show/:id'  => 'markets#show', as: 'markets_show'

  get 'markets/edit'

  get 'vendors/edit' => 'vendors#edit', as: 'vendors_edit'

  get 'vendors/index' => 'vendors#index', as: 'vendors_index'

  get 'vendors/new'

  post 'vendors/create' => 'vendors#create', as:'vendors_create'

  get 'vendors/:id/show'  => 'vendors#show', as:'vendors_show'

  post 'vendors/:id/update' => 'vendors#update', as:'vendors_update'

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
