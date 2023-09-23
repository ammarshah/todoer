Rails.application.routes.draw do
  root to: "homepage#index"

  resources :todos, only: :create

  resources :taglines, only: [] do
    get 'random', on: :collection
  end
end
