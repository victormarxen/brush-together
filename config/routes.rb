Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :toothbrushes do
    resources :reservations
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/cards", to: "pages#cards"
  # Defines the root path route ("/")
  # root "articles#index"
end
