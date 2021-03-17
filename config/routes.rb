Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root "films#index"
    resources :films
    resource :about
    resource :contact
  end
end
