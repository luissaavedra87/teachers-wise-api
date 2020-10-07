Rails.application.routes.draw do
  resources :appoinments
  resources :users
  resources :teachers
  
  post '/login', to: 'auth#login'
  get '/session', to: 'auth#session'
end
