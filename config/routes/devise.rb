# The reason for the below customizations of Devise routes
# is to have shorter, cleaner and more sensible URLs like:
#
#   '/login'          instead of  '/users/sign_in'
#   '/logout'         instead of  '/users/sign_out'
#   '/register'       instead of  '/users/sign_up'
#   '/account/delete' instead of  '/users/cancel'
#   '/account/edit'   instead of  '/users/edit'
#   '/forgot'         instead of  '/users/password/new'
#   '/password'       instead of  '/users/password/edit'
#   '/confirm'        instead of  '/users/confirmation/new'
#
devise_for :users, skip: :all

devise_scope :user do
  # Session routes for Authenticatable
  get    'login',  to: 'devise/sessions#new',     as: :new_user_session
  get    'login',  to: 'devise/sessions#new',     as: :login # Optional: provides `login_path` helper
  post   'login',  to: 'devise/sessions#create',  as: :user_session
  delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  delete 'logout', to: 'devise/sessions#destroy', as: :logout # Optional: provides `logout_path` helper

  # Registration routes for Registerable
  get    'register',       to: 'devise/registrations#new',     as: :new_user_registration
  get    'register',       to: 'devise/registrations#new',     as: :register # Optional: provides `register_path` helper
  get    'account/delete', to: 'devise/registrations#cancel',  as: :cancel_user_registration
  get    'account',        to: 'devise/registrations#edit',    as: :edit_user_registration
  get    'account',        to: 'devise/registrations#edit',    as: :account # Optional: provides `account_path` helper
  patch  'account',        to: 'users/registrations#update',   as: :user_registration
  put    'account',        to: 'users/registrations#update',   as: nil
  delete 'account',        to: 'devise/registrations#destroy', as: nil
  post   'account',        to: 'devise/registrations#create',  as: nil

  # Password routes for Recoverable
  get   'forgot',   to: 'devise/passwords#new',    as: :new_user_password
  get   'forgot',   to: 'devise/passwords#new',    as: :forgot # Optional: provides `forgot_path` helper
  get   'password', to: 'devise/passwords#edit',   as: :edit_user_password
  patch 'password', to: 'devise/passwords#update', as: :user_password
  put   'password', to: 'devise/passwords#update', as: nil
  post  'password', to: 'devise/passwords#create', as: nil

  # Confirmation routes for Confirmable
  get  'confirm',      to: 'devise/confirmations#new',    as: :new_user_confirmation
  get  'confirm',      to: 'devise/confirmations#new',    as: :confirm # Optional: provides `confirm_path` helper
  get  'confirmation', to: 'users/confirmations#show',    as: :user_confirmation
  post 'confirmation', to: 'devise/confirmations#create', as: nil
end
