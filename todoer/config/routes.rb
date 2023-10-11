Rails.application.routes.draw do
  root to: "home#index"

  resources :todos, only: :create

  resources :taglines, only: [:index]
end
