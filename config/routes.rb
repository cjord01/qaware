Rails.application.routes.draw do

  get 'forms/confirmation'
  get 'completed_forms/keg' => 'completed_forms#keg'
  get 'completed_forms/kitchen' => 'completed_forms#kitchen'
  get 'completed_forms/restroom' => 'completed_forms#restroom'
  get 'completed_forms/today' => 'completed_forms#today'
  get 'completed_forms/week' => 'completed_forms#week'
  get 'completed_forms/month' => 'completed_forms#month'
  get 'completed_forms/keg_today' => 'completed_forms#keg_today'
  get 'completed_forms/keg_week' => 'completed_forms#keg_week'
  get 'completed_forms/keg_month' => 'completed_forms#keg_month'
  get 'completed_forms/kitchen_today' => 'completed_forms#kitchen_today'
  get 'completed_forms/kitchen_week' => 'completed_forms#kitchen_week'
  get 'completed_forms/kitchen_month' => 'completed_forms#kitchen_month'
  get 'completed_forms/restroom_today' => 'completed_forms#restroom_today'
  get 'completed_forms/restroom_week' => 'completed_forms#restroom_week'
  get 'completed_forms/restroom_month' => 'completed_forms#restroom_month'

  resources :forms
  resources :completed_forms
  resources :employees

  get 'beacons' => 'beacons#index'


  get 'graphs' => 'graphs#index'


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
