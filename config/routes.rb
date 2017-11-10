Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories

  #get '/topics/:id/destroy',to: 'topics#destroy'
  resources :speakerarchives
# devise_for :users should come before resources :users

  resources :users

  resources :users, only: [:show] do
    # nested resource for topics
    resources :topics, only: [:show, :index]
  end

 resources :topics


  root 'welcome#index'


end
