Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  resources :topics
  #get '/topics/:id/destroy',to: 'topics#destroy'
  resources :speakerarchives
# devise_for :users should come before resources :users
  devise_for :users
  resources :users

  root 'welcome#index'


end
