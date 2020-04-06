Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'

  get '/new', to: 'cocktails#new'
  post '/', to: 'cocktails#create'
  post '/query', to: 'cocktails#search_index'
  delete '/:id', to: 'cocktails#destroy'

  get '/:id', to: 'doses#index'
  post '/:id', to: 'doses#create'
  get '/:id/:dose_id', to: 'doses#edit'
  post '/:id/:dose_id', to: 'doses#update'
  delete '/:id/:dose_id', to: 'doses#destroy'
end
