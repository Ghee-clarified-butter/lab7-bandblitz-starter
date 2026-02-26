# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
resources :users
resources :sessions
get 'user/edit' => 'users#edit', :as => :edit_current_user
get 'signup' => 'users#new', :as => :signup
get 'login' => 'sessions#new', :as => :login
get 'logout' => 'sessions#destroy', :as => :logout

# Default route
root :to => 'bands#index', :as => :home
run Rails.application
