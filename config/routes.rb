Rails.application.routes.draw do
  resources :trips
  root 'static_pages#home'
  devise_for :users
  get 'persons/profile'
  get 'tickets/buy'

end
