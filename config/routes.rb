Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/developers', to: 'developers#index'
  get '/developers/new', to: 'developers#new'
  get '/developers/:id/games/new', to: 'developers_games#new'
  post '/developers', to: 'developers#create'
  post '/developers/:id/games', to: 'developers_games#create'
  get '/developers/:id', to: 'developers#show'
  get '/developers/:id/games', to: 'developers_games#index'
  get '/developers/:id/edit', to: 'developers#edit'
  patch '/developers/:id', to: 'developers#update'
  delete '/developers/:id', to: 'developers#destroy'


  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'
  get '/games/:id/edit', to: 'games#edit'
  patch '/games/:id', to: 'games#update'
  delete '/games/:id', to: 'games#destroy'


  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  post '/authors', to: 'authors#create'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/books', to: 'authors#show_authors_with_books'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'
  delete '/authors/:id', to: 'authors#destroy'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
end
