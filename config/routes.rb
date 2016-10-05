Rails.application.routes.draw do
  root to: 'users#index'

  # main index page
  get 'users/index' => 'users#index', as: 'usersindex'

  get 'users/show' => 'users#show', as: 'usersshow'



  get 'products/index' => 'products#index', as: "productsindex"

  get 'products/new' => 'products#new', as: "productsnew"

  get 'products/show/:id' => 'products#show', as: "productsshow"

  get 'products/:id/edit' => 'products#edit', as: "productsedit"

  post 'products/create' => 'products#create', as: "productscreate"

  patch 'products/:id/update' => 'products#update', as: "productsupdate"

  delete 'products/:id/destroy' => 'products#destroy', as: "productsdestroy"



  get 'sales/index' => 'sales#index', as: "salesindex"

  get 'sales/new' => 'sales#new', as: "salesnew"

  get 'sales/show/:id' => 'sales#show', as: "salesshow"

  get 'sales/:id/edit' => 'sales#edit', as: "salesedit"

  post 'sales/create' => 'sales#create', as: "salescreate"

  patch 'sales/:id/update' => 'sales#update', as: "salesupdate"

  delete 'sales/:id/destroy' => 'sales#destroy', as: "salesdestroy"



  get 'markets/index' => 'markets#index', as: "marketsindex"

  get 'markets/show/:id' => 'markets#show', as: "marketsshow"

  get 'markets/:id/edit' => 'markets#edit', as: "marketsedit"

  get 'markets/new' => 'markets#new', as: "marketsnew"

  post 'markets/create' => 'markets#create', as: "marketscreate"

  patch 'markets/:id/update' => 'markets#update', as: "marketsupdate"

  delete 'markets/:id/destroy' => 'markets#destroy', as: "marketsdestroy"



  get 'vendors/index' => 'vendors#index', as: "vendorsindex"

  get 'vendors/new' => 'vendors#new', as: "vendorsnew"

  get 'vendors/show/:id' => 'vendors#show', as: "vendorsshow"

  get 'vendors/:id/edit' => 'vendors#edit', as: "vendorsedit"

  post 'vendors/create' => 'vendors#create', as: "vendorscreate"

  patch 'vendors/:id/update' => 'vendors#update', as: "vendorsupdate"

  delete 'vendors/:id/destroy' => 'vendors#destroy', as: "vendorsdestroy"

end
