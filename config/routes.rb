Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :stats, except: :show
  resources :sessions
  resources :cardios
  resources :exercises do
    resources :setsets, only: [ :index, :new, :create ]
  end
  resources :setsets, only: [ :edit, :update ]
end
