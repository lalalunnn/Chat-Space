Rails.application.routes.draw do
  devise_for :users

  get "/chat-space" => 'chats#index'

  root 'chats#index'
end
