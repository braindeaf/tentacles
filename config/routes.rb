Admin::Engine.routes.draw do
  get '/' => 'main#index'
  get    '/m/:m'          => 'admin/models#index', as: :models
  get    '/m/:m/new'      => 'admin/models#new', as: :new_model
  post   '/m/:m'          => 'admin/models#create'
  get    'm/:m/:id'       => 'admin/models#show', as: :model
  get    '/m/:m/:id/edit' => 'admin/models#edit', as: :edit_model
  put    '/m/:m/:id'      => 'admin/models#update'
  patch   '/m/:m/:id'     => 'admin/models#update'
  delete '/m/:m/:id'      => 'admin/models#destroy'
end
