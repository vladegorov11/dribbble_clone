namespace :search do
  get '', to: 'search#index' , as: '/'
  get 'designers', to: 'search#designers'
  get 'tags', to: 'search#tags'
  get 'skills', to: 'search#skills'
end