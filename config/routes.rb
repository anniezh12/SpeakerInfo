Rails.application.routes.draw do
  resources :categories
  resources :speakerarchives
  resources :topics
  devise_for :users
  resources :users
  #post "/users/sign_up", to: 'users#edit'

  root 'welcome#index'


end
