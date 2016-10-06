Rails.application.routes.draw do

  root 'far_mar#index'

  get 'far_mar/index' => 'far_mar#index', as: 'index'

  #################################

  get 'market_admins/index' => 'market_admins#index', as: 'market_admins'

  get 'market_admins/show/:id' => 'market_admins#show', as: 'show_market'

  get 'market_admins/new' => 'market_admins#new', as: 'new_market'

  post 'market_admins/create' => 'market_admins#create', as: 'create_market'

  get 'market_admins/edit'

  get 'market_admins/update'

  get 'market_admins/destroy'

  #################################

  get 'vendors/index' => 'vendors#index', as: 'vendors'

  get 'vendors/show' => 'vendors#show', as: 'show_vendor'

  get 'vendors/new'

  get 'vendors/create'

  get 'vendors/edit'

  get 'vendors/update'

  get 'vendors/destroy'

  ###############################

  get 'sales/index'

  get 'sales/show'

  get 'sales/new'

  get 'sales/create'

  get 'sales/edit'

  get 'sales/update'

  get 'sales/destroy'

  ###############################

  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'

  ###############################

  get 'visitors/index' => 'visitors#index', as: 'visitors'

  get 'visitors/show_markets'

  get 'visitors/show_vendors'

  get 'visitors/show_products'

  get 'visitors/show_markets_by_product'

end
