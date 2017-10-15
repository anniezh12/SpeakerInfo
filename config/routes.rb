Rails.application.routes.draw do
  resources :categories
  resources :speakerarchives
  resources :topics
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  root 'welcome#index'

end
