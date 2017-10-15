Rails.application.routes.draw do
  resources :categories
  resources :speakerarchives
  resources :topics
  resources :users
  devise_for :users
  root 'welcome#index'

end
