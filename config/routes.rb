Rails.application.routes.draw do
  resources :matches
  resources :championnats
  
  root 'welcome#index'
  
  get '/admin', to: 'admin#index'
  post '/admin/github', to: 'admin#github'
  resources :championnats
  resources :matches

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end