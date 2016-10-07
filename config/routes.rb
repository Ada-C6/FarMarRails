Rails.application.routes.draw do

  root 'far_mar#index'

  get 'far_mar/index' => 'far_mar#index', as: 'index'

  get 'far_mar/admin_home' => 'far_mar#admin_home', as: 'admin_home'

  get 'far_mar/vendor_home' => 'far_mar#vendor_home', as: 'vendor_home'

  #################################

  get 'market_admins/index' => 'market_admins#index', as: 'market_admins'

  get 'market_admins/show/:id' => 'market_admins#show', as: 'show_market'

  get 'market_admins/new' => 'market_admins#new', as: 'new_market'

  post 'market_admins/create' => 'market_admins#create', as: 'create_market'

  get 'market_admins/:id/edit' => 'market_admins#edit', as: 'edit_market'

  patch 'market_admins/:id/update' => 'market_admins#update', as: 'update_market'

  delete 'market_admins/destroy'

  #################################

  get 'vendors/index' => 'vendors#index', as: 'vendors'

  get 'vendors/show/:id' => 'vendors#show', as: 'show_vendor'

  get 'vendors/new' => 'vendors#new', as: 'new_vendor'

  post 'vendors/create' => 'vendors#create', as: 'create_vendor'

  get 'vendors/:id/edit' => 'vendors#edit', as: 'edit_vendor'

  patch 'vendors/:id/update' => 'vendors#update', as: 'update_vendor'

  delete 'vendors/destroy'

  ###############################

  get 'products/index' => 'products#index', as: 'products'

  get 'products/show/:id' => 'products#show', as: 'show_product'

  get 'products/new' => 'products#new', as: 'new_product'

  post 'products/create' => 'products#create', as: 'create_product'

  get 'products/:id/edit' => 'products#edit', as: 'edit_product'

  patch 'products/:id/update' => 'products#update', as: 'update_product'

  delete 'products/destroy'

  ###############################

  get 'sales/index' => 'sales#index', as: 'sales'

  get 'sales/show/:id' => 'sales#show', as: 'show_sale'

  get 'sales/new' => 'sales#new', as: 'new_sale'

  post 'sales/create' => 'sales#create', as: 'create_sale'

  get 'sales/:id/edit' => 'sales#edit', as: 'edit_sale'

  patch 'sales/:id/update' => 'sales#update', as: 'update_sale'

  delete 'sales/destroy'

  ###############################


  get 'visitors/index' => 'visitors#index', as: 'visitors'

  get 'visitors/show_markets' => 'visitors#show_markets', as: 'show_markets'

  get 'visitors/show_vendors' => 'visitors#show_vendors', as: 'show_vendors'

  get 'visitors/show_products' => 'visitors#show_products', as: 'show_products'

  get 'visitors/:id/show_market_vendor_products' => 'visitors#show_market_vendor_products', as: 'show_all'

end
