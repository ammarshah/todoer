Rails.application.routes.draw do
  # Loads Devise routes from `config/routes/devise.rb`
  draw(:devise)

  root to: "home#index"

  resources :todos, only: :create

  resources :taglines, only: :index
end
