Rails.application.routes.draw do

  root 'welcome#index'
  
  get '/admin', to: 'admin#index', as: 'admin_home'
  post '/admin/github', to: 'admin#github'
  get '/admin/predict', to: 'admin#predict', as: 'make_prediction'

  resources :championnats
  resources :matches

  get '/:id', to: 'welcome#index', as: "select_champ"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end