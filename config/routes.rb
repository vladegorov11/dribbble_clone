Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    resources :designers  do
      resources :comments, only: [:index] 
      resources :cards
      member do
        resources :notifications do 
          put 'destroy_all', to: "notifications#destroy_all"
        end
        get 'followers', to: "designers#followers"
        get 'dashboard', to: 'dashboard#index'
        get 'follow', to: "designers#follow"
        get 'unfollow', to: "designers#unfollow"
      end
    end

    #get 'search', to: 'shots#search'
    root 'shots#index' #, locale: I18n.locale
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
    
    resources :users

    resources :conversations do
      resources :messages
    end
    
    draw :admin
    draw :search

  end
end
