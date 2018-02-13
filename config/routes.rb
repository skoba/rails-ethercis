Rails.application.routes.draw do
  get 'aql/index'
  get 'home/index'

  resources :people
  resources :ehrs
#  get 'compsition/:id', to: 'compositions#show'
  resources :compositions
  resources :templates
#b  post '/session', to: 'sessions#create'

#  get 'sessions/destroy'

  root to: 'home#index'
end
