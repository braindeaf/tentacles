Tentacles::Engine.routes.draw do
  get '/' => 'tentacles/main#index'
  scope '/:klass' do
    get    '/'         => 'tentacles/models#index', as: :models
    get    '/new'      => 'tentacles/models#new', as: :new_model
    post   '/'         => 'tentacles/models#create'
    get    '/:id'      => 'tentacles/models#show', as: :model
    get    '/:id/edit' => 'tentacles/models#edit', as: :edit_model
    put    '/:id'      => 'tentacles/models#update'
    patch  '/:id'      => 'tentacles/models#update'
    delete '/:id'      => 'tentacles/models#destroy'    
  end
end
