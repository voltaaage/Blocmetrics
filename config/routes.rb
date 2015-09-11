Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'

  resources :users, only: [:update] 
  resources :registered_applications
  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#create', via: [:options]
    resources :events, only: [:create]
  end
end
