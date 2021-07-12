Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles #, only: [:show, :index, :new, :create, :edit, :update, :destroy] # We slowly added all of the routes in one by one to learn about them. resources :articles has all of these, so having them all listed is no longer necessary.
end
