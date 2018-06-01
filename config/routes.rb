Rails.application.routes.draw do
  resources :designers  do 
    member do 
      get 'follow', to: "designers#follow"
      get 'unfollow', to: "designers#unfollow"
    end
  end
  root 'shots#index'
  resources :shots  do
    resources :comments do
      member do 
        put 'like', to: "comments#like"
        put 'unlike', to: "comments#unlike"
      end
    end
    member do 
      put 'like', to: "shots#like"
      put 'unlike', to: "shots#unlike"
    end
  end
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
