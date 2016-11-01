Rails.application.routes.draw do
  devise_for :users

  resources :messages
  resources :users, only: [:edit , :update]
  root  'messages#index'

end
