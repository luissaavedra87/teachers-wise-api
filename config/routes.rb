Rails.application.routes.draw do
  resources :appoinments
  resources :users,  only: [:create, :show, :index]
  resources :teachers
  
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  post '/signup', to: 'users#create'
end
