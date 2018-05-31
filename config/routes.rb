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

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    #get 'all_user', to: 'dashboard#all_user'
    #get 'create_content_for_user/:id', to: 'dashboard#create_content_for_user', as: 'create_content_for_user'
  end

  resources :conversations do
    resources :messages
  end
end
