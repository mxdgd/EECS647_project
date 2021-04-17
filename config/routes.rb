Rails.application.routes.draw do
  #devise_for :users
  namespace :admin do
    root "films#index"
    resources :films
    resource :about
    resource :contact
  end
  root "indexes#index"
  get '/', to: 'indexes#index'
  resources :films, only: [:index, :show]
  get 'users', to: 'users#index'
  post 'login', to: 'users#login'
end