Rails.application.routes.draw do
  resources :posts
  post 'auth/register' , to: 'users#register'
  post 'auth/login' , to: 'users#login'
  get 'edouga' , to: 'users#edouga'
  root 'home#index'
end
