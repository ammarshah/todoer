Rails.application.routes.draw do
  # Loads Devise routes from `config/routes/devise.rb`
  draw(:devise)

  root to: "home#index"

  # get 'app', to: 'app#index'

  resource :app, only: [:show]

  resources :todos, only: [:index, :create, :update, :destroy]

  resources :taglines, only: :index
end
