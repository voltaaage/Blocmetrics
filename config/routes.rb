Rails.application.routes.draw do
  get 'events/index'

  get 'events/new'

  get 'events/show'

  get 'events/create'

  get 'events/update'

  get 'events/destroy'

  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'

  resources :users, only: [:update] 
  resources :registered_applications
  resources :events
end
