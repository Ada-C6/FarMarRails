Rails.application.routes.draw do
  root 'farmers#index'
  get '/farmers' => 'farmers#index'

  get 'farmers/markets' => 'markets#index1'
  get 'farmers/markets/:id', to: 'markets#show1', as: 'market'


  get 'farmers/market_views' => 'markets#index2'
  get 'farmers/market_views/new' => 'markets#new'
  post 'farmers/market_views' => 'markets#create'
  get 'farmers/market_views/:id', to: 'markets#show2', as: 'market_view'

  get 'farmers/vendors' => 'vendors#index'
  get 'farmers/vendors/:id', to: 'vendors#show', as: 'vendor'

  get 'farmers/vendors/:id/products', to: 'vendors#show_products', as: 'vendor_products'

  get 'farmers/vendors/:id/products/new', to: 'vendors#new_product', as: 'vendor_products_new'
  post 'farmers/vendors/:id/products' => 'vendors#create_product'


  get 'farmers/vendors/:id/sales', to: 'vendors#show_sales', as: 'vendor_sales'





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
