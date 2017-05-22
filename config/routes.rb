Rails.application.routes.draw do
  
 

  root 'sessions#login'

  get '/login', to: 'sessions#login'

  post 'sessions/create', as:'signin'

  delete '/signout', to: 'sessions#delete'

  resources :users
  resources :posts, only: [:new,:create,:index]

end
