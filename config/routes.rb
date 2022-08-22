Rails.application.routes.draw do
  get 'gears/home'
  devise_for :users
  root to: "gears#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
