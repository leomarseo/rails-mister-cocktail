Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'

  resources :cocktails, only: %i[index new create destroy show] do
    resources :doses, only: %i[create edit update destroy]
    resources :reviews, only: %i[create edit update destroy]
  end

  # root to: 'cocktails#index'

  # get '/new', to: 'cocktails#new'
  # post '/', to: 'cocktails#create'
  # post '/query', to: 'cocktails#search_index'
  # get '/:id', to: 'cocktails#show'
  # delete '/:id', to: 'cocktails#destroy'

  # post '/:id', to: 'doses#create'
  # get '/:id/:dose_id', to: 'doses#edit'
  # post '/:id/:dose_id', to: 'doses#update'
  # delete '/:id/:dose_id', to: 'doses#destroy'
end
