Rails.application.routes.draw do
  devise_for :users

  get '/bookings/all_renters', to: 'bookings#all_renters', as: :all_renters
  resources :bookings, only: %i[index show update destroy]


  root to: "gears#home"
  get '/search', to: 'gears#search', as: :search
  resources :gears do
    resources :bookings, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
