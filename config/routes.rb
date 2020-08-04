Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'sessions#signup'
  get '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
end
