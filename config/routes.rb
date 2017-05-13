Rails.application.routes.draw do
  resources :trips
  resources :tickets
  root 'static_pages#home'
  devise_for :users
  get 'profile', to: 'persons#profile'
  get 'booking/seats', to: 'booking#seats'
end
