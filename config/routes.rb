Rails.application.routes.draw do

  get 'forms/confirmation'
  resources :forms
  resources :completed_forms
  resources :employees

  get 'beacons' => 'beacons#index'


  # get 'welcome/index'

  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  namespace :api do
    get 'forms' => 'forms#index'
    post 'sessions' => 'sessions#create'
    put 'beacons' => 'beacons#update'
    delete 'beacons' => 'beacons#destroy'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/completed_forms/refresh/:id' => 'completed_forms#refresh'


end
