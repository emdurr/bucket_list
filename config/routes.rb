Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }

  resources :lists do
  	resources :items
  end
end
