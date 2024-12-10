Rails.application.routes.draw do
  root "patients#index"
  devise_for :users
  resources :patients
  resources :doctors
  get '/graph', to: 'dashboard#graph'
end
