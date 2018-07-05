Rails.application.routes.draw do
  resources :designers  do
    resources :comments, only: [:index] 
    resources :cards
    member do
      resources :notifications
      get 'followers', to: "designers#followers"
      get 'dashboard', to: 'dashboard#index'
      get 'follow', to: "designers#follow"
      get 'unfollow', to: "designers#unfollow"
    end
  end
  root 'shots#index'
  resources :shots  do
    resources :comments, except: [:index] do
      resources :reports, only: [:new, :create]
    end
    resources :reports, only: [:new, :create]
    member do 
      put 'like', to: "shots#like"
      put 'unlike', to: "shots#unlike"
    end
  end
  resources :hues, only: [:show]
  resources :skills, only: [:show]
  resources :tags, only: [:show]
  devise_for :users, controllers: {registrations: 'registrations'}

  resources :conversations do
    resources :messages
  end

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end

end
