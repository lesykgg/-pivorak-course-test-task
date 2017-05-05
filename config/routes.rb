Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile'

	root 'static_pages#home'
	match 'signup', to: 'users#new', via: "get"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
