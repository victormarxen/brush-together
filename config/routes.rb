Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :toothbrushes do
    resources :reviews, only: %i[index create]
  end
  resources :reviews, only: :destroy

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
