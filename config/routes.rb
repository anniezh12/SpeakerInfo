Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :forumtopics
  resources :forums
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}
    #,    :registrations => "registrations" }

#  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories

  #get '/topics/:id/destroy',to: 'topics#destroy'

  resources :speakerarchives

get '/users/most_lectures', to: 'users#user_with_most_lectures'
get '/users/least_lectures', to: 'users#user_with_least_lectures'
get '/speakers', to: 'welcome#displayspeakers'
# devise_for :users should come before resources :users


  resources :users


  resources :users, only: [:show,:index] do
    # nested resource for topics
    resources :topics, only: [:new,:show, :index]
  end


 resources :topics
 get '/topics/next/:id', to: 'topics#next'
 get '/topics/previous/:id', to: 'topics#previous'
 # resources :topics, only:[:create,:show,:index] do
 #    #nested resources for forums
 #    resources :forums, only:[:new,:show,:index]
 # end


  root 'welcome#index'


end
