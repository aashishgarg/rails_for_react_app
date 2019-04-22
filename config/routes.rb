Rails.application.routes.draw do
  resources :posts
  root 'static_pages#welcome'
  get 'static_pages/welcome'

  get '/home', to: 'static_pages#home'
end
