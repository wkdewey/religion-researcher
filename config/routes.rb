Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :researchers
  get '/signin', to: 'researchers#signin'
  get '/login', to: 'researchers#login'
  get '/logout', to: 'researchers#logout'
end
