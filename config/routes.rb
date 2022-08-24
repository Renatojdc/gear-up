Rails.application.routes.draw do
  devise_for :users

  resources :bookings, only: %i[index show]

  root to: "gears#home"
  get '/search', to: 'gears#search', as: :search
  resources :gears, only: %i[new create show edit update destroy] do
    resources :bookings, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
