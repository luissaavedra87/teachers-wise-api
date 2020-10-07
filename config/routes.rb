Rails.application.routes.draw do
  resources :users
  resources :teachers
  
  post '/login', to: 'auth#login'
  get '/session', to: 'auth#session'
end
