Rails.application.routes.draw do

  root 'users#index'


  resources :jobs
  # resources :users
  # get 'users' => 'users#login'
  # post 'users' => 'users#login'

  get 'users/index'
  post 'users/login'
  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
