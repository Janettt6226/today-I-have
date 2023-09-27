Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  resources :posts
  get "my updates", to: "posts#updates", as: :updates
  resources :tags, only: %i[index show], param: :name
end
