Rails.application.routes.draw do

  root 'far_mar#index'

  get 'far_mar/index' => 'far_mar#index', as: 'index'

  #################################

  get 'market_admins/index' => 'market_admins#index', as: 'market_admins'

  get 'market_admins/show/:id' => 'market_admins#show', as: 'show_market'

  get 'market_admins/new' => 'market_admins#new', as: 'new_market'

  post 'market_admins/create' => 'market_admins#create', as: 'create_market'

  get 'market_admins/:id/edit' => 'market_admins#edit', as: 'edit_market'

  patch 'market_admins/:id/update' => 'market_admins#update', as: 'update_market'

  get 'market_admins/destroy'

  #################################

  get 'vendors/index' => 'vendors#index', as: 'vendors'

  get 'vendors/show/:id' => 'vendors#show', as: 'show_vendor'

  get 'vendors/new'

  get 'vendors/create'

  get 'vendors/edit'

  get 'vendors/update'

  get 'vendors/destroy'

  ###############################

  get 'products/index' => 'products#index', as: 'products'

  get 'products/show/:id' => 'products#show', as: 'show_product'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'

  ###############################

  get 'sales/index' => 'sales#index', as: 'sales'

  get 'sales/show/:id' => 'sales#show', as: 'show_sale'

  get 'sales/new'

  get 'sales/create'

  get 'sales/edit'

  get 'sales/update'

  get 'sales/destroy'

  ###############################


  get 'visitors/index' => 'visitors#index', as: 'visitors'

  get 'visitors/show_markets'

  get 'visitors/show_vendors'

  get 'visitors/show_products'

  get 'visitors/show_markets_by_product'

end
