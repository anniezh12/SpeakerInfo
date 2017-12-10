Rails.application.routes.draw do


  resources :forumtopics
  resources :forums
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories

  #get '/topics/:id/destroy',to: 'topics#destroy'
  resources :speakerarchives

get '/users/most_lectures', to: 'users#user_with_most_lectures'
get '/users/least_lectures', to: 'users#user_with_least_lectures'
# devise_for :users should come before resources :users

  resources :users


  resources :users, only: [:show,:index] do
    # nested resource for topics
    resources :topics, only: [:new,:show, :index]
  end


 resources :topics
 #
 # resources :topics, only:[:create,:show,:index] do
 #    #nested resources for forums
 #    resources :forums, only:[:new,:show,:index]
 # end


  root 'welcome#index'


end
