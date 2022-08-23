Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :toothbrushes do
    resources :reviews, only: %i[index create]
    resources :reservations
  end
  resources :reviews, only: :destroy

end
