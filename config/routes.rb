# frozen_string_literal: true

Rails.application.routes.draw do
  resources :appoinments
  resources :users
  resources :teachers

  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  post '/signup', to: 'users#create'
  get '/users/:id/appoinments', to: 'users#appoinments'
end
