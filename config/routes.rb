Tasquee::Application.routes.draw do
  resources :appointments
  resources :tasks
  resources :customers

  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  match '/' => 'sessions#new'
  match 'settings' => 'events#settings', :as => :settings

  resources :sessions
  resources :users
  resources :events do
    post :sort, on: :collection
  end

  resources :availabilities
  resources :holidays
  resources :absences

  root :to => 'events#index'
end
