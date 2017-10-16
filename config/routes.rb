Rails.application.routes.draw do
  resources :categories
  resources :topics
  resources :speakerarchives

  devise_for :users
  resources :users

  root 'welcome#index'


end
