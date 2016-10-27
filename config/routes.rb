Rails.application.routes.draw do
  resources :matches
  resources :championnats
  get 'admin/index'
  get '/admin', to: 'admin#index'
  post '/admin/github', to: 'admin#github'
  get '/', to: 'welcome/index'
  resources :championnats
  resources :matches

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end