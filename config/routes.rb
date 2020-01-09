Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'bookings/start_date'
  get 'bookings/end_date'
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plants do
   resources :bookings
  end


end
