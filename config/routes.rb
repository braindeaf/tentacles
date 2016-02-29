Tentacles::Engine.routes.draw do
  get '/' => 'main#index'
  get    '/m/:m'          => 'tentacles/models#index', as: :models
  get    '/m/:m/new'      => 'tentacles/models#new', as: :new_model
  post   '/m/:m'          => 'tentacles/models#create'
  get    'm/:m/:id'       => 'tentacles/models#show', as: :model
  get    '/m/:m/:id/edit' => 'tentacles/models#edit', as: :edit_model
  put    '/m/:m/:id'      => 'tentacles/models#update'
  patch   '/m/:m/:id'     => 'tentacles/models#update'
  delete '/m/:m/:id'      => 'tentacles/models#destroy'
end
