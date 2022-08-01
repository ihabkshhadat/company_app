Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :companies
  resources :users
  resources :projects
  # Defines the root path route ("/")
  root "companies#index"
end
