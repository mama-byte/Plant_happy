Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [ :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :bookings, only: [:show]
  end

  resources :bookings, only: [:new, :create, :index, :destroy]

end
