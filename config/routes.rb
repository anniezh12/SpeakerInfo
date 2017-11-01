Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  resources :topics
  #get '/topics/:id/destroy',to: 'topics#destroy'
  resources :speakerarchives
# devise_for :users should come before resources :users

  resources :users

  root 'welcome#index'


end
