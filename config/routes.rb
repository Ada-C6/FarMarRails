Rails.application.routes.draw do

  root to: 'pages#home'

  get '/markets/:id/show', to: 'markets#guest_show'

  get '/vendors/:id/show', to: 'vendors#guest_show'

  get '/markets/all', to: 'markets#all', as: 'markets_all'

  get '/vendor_search', to: 'pages#vendor_search', as: 'vendor_search'

  get '/product_search', to: 'pages#product_search', as: 'product_search'

  get '/market_search', to: 'pages#market_search', as: 'market_search'

  get '/vendor_login', to: 'pages#vendor_login'

  get '/market_login', to: 'pages#market_login'

  get '/admin_market_login', to: 'pages#admin_market_login'

  get '/admin_vendor_login', to: 'pages#admin_vendor_login'

  post '/admin', to: "markets#create"

  get 'vendors/:id/sales', to: 'vendors#show_sales', as: 'show_sales'

  resources :markets, :vendors, :products, :sales

  get '/home', to: 'pages#home'

  get '/admin', to: 'pages#admin'

  get '/vendor', to: 'pages#vendor'

  get '/market', to: 'pages#market'

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
