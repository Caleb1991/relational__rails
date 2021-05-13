Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/developers', to: 'developers#index'
  get '/developers/:id', to: 'developers#show'
  get 'developers/:id/games', to: 'developers_games#index'

  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'


  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'

  get '/books', to: 'books#index'
end
