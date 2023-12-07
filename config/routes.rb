Rails.application.routes.draw do
  root to: "home#index"

  # Loads Devise routes from `config/routes/devise.rb`
  draw(:devise)

  resource :app, only: [:show]

  resources :todos, only: [:index, :create, :update, :destroy]

  resources :taglines, only: :index

  get 'approach_us', to: 'approachments#new'
  post 'approach_us', to: 'approachments#create'
end
