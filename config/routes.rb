Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth/login', to: 'authentications#authenticate'
  post '/signup', to: 'users#create'
  resources :todos do
    resources :items 
  end
end
