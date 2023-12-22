Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  # Loads Devise routes from `config/routes/devise.rb`
  draw(:devise)

  resource :app, only: [:show]

  resources :todos, only: [:index, :create, :update, :destroy]

  resources :taglines, only: :index

  get 'approach_us', to: 'approachments#new'
  post 'approach_us', to: 'approachments#create'
end
