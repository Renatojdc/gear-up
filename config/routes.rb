Rails.application.routes.draw do
  get 'bookings/index'
  devise_for :users
  
  resources :booking, only: :index

  root to: "gears#home"
  resources :gears, only: %i[new create show edit update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
