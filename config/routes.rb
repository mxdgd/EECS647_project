Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :films
    resource :about
  end
end
