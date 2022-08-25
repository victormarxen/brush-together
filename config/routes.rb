Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :toothbrushes do
    resources :reviews, only: %i[index create]
    resources :reservations, only: %i[new create]
  end
  resources :reviews, only: :destroy
  resources :reservations, only: %i[index update destroy]

  get '/my_reservations', to: 'reservations#announcer_pending'
end
