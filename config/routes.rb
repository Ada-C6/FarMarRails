Rails.application.routes.draw do
  root 'markets#overview'
  get '/markets/view', to: 'markets#view_markets', as: 'view_all_markets'
  get '/markets/view/:id', to: 'markets#view_market', as: 'view_market'

  resources :markets, except: [:destroy]
  get '/markets/:id/vendors', to: 'markets#market_vendors', as: 'market_view_vendors'
  get '/markets/:id/vendors/new', to: 'markets#market_new_vendor', as: 'market_new_vendor'
  post '/markets/:id/vendors', to: 'markets#market_create_vendor', as: 'market_post_vendor'

  resources :vendors do
    resources :products, except: [:show]
    resources :sales, only: [:index, :create, :new]
  end

  get '/vendors/:id/products', to: 'vendors#view_products', as: 'vendor_view_products'

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
