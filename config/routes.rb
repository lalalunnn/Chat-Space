Rails.application.routes.draw do
  devise_for :users

  resources :groups, only: [:index, :show, :new , :create, :edit, :update] do
    resources :messages, only: [:new, :create]
  end

  resources :users, only: [:index, :edit, :update]
  root  'groups#index'

end
