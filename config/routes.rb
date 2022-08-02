Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :companies
  resources :users
  resources :projects
  get 'filter_user_by_company' => 'projects#filter_user_by_company'

  # Defines the root path route ("/")
  root "companies#index"
end
