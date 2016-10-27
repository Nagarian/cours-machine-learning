Rails.application.routes.draw do

  root 'welcome#index'
  
  get '/admin', to: 'admin#index'
  post '/admin/github', to: 'admin#github'

  resources :championnats
  resources :matches

  get '/:id', to: 'welcome#index', as: "lala"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end