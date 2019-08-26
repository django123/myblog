Rails.application.routes.draw do
  post 'auth/register', to: 'users#register'
  root 'home#index'

end
