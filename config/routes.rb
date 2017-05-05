Rails.application.routes.draw do


  root 'static_pages#home'

  devise_for :users
  get 'persons/profile'

  resources :trips
end
