Rails.application.routes.draw do
  devise_for :users

  resources :groups, only: [:new , :create, :edit, :update]
  resources :messages,only: [:index, :new , :create]

  resources :users, only: [:edit , :update]
  root  'messages#index'

end
