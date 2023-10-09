Rails.application.routes.draw do
  root to: "homepage#index"

  resources :todos, only: :create

  resources :taglines, only: [:index]
end
