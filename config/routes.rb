Rails.application.routes.draw do
  resources :people
  resources :ehrs
#  get 'compsition/:id', to: 'compositions#show'
  resources :compositions
  resources :templates
#b  post '/session', to: 'sessions#create'

#  get 'sessions/destroy'

end
