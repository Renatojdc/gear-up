Rails.application.routes.draw do
  devise_for :users
  root to: "gears#home"
  resources :gears, only: %i[new create show edit update delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
