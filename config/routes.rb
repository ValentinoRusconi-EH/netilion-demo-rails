Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  get 'assets', to: 'assets#index', as: 'assets'

  # Route for deleting an asset
  delete 'assets/:id', to: 'assets#destroy', as: 'asset'

end
