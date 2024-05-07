Rails.application.routes.draw do
  root 'users#servertest'
  post '/users', to: 'users#create'
  post '/login', to: 'users#authenticate'
end
