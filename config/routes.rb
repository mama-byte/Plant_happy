Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :plants do
    resources :bookings, only: [:create, :show, :new]
  end
  # resources :bookings, only: [:index, :destroy]
  resources :users, only: [ :show, :edit, :update]
  resources :bookings, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
