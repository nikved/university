University::Application.routes.draw do

  resources :schedules
  resources :sessions
  resources :students
  resources :exams
  resources :lessons

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'home#index', :as => 'login'
  get 'signup' => 'students#new', :as => 'signup'


  root :to => 'home#index'


end
