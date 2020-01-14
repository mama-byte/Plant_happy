Rails.application.routes.draw do
  devise_for :users
  root to: 'plants#index'

  resources :plants do
    resources :bookings, only: [:create, :show, :new]
  end
  # resources :bookings, only: [:index, :destroy]
  resources :users, only: [ :edit, :update]
  get "/profile", to: 'users#show', as: :profile
  resources :bookings, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
