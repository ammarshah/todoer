# Keys that are required in all environments
# and they should be stored in .env file
common_required_keys = [
  "APP_HOST",
  "APP_PORT",
  "POSTGRES_USERNAME",
  "POSTGRES_PASSWORD",
  "SMTP_ADDRESS",
  "SMTP_PORT",
  "SMTP_USERNAME",
  "SMTP_PASSWORD",
  "DEFAULT_FROM_EMAIL",
  "DEFAULT_REPLY_TO_EMAIL",
  "TODOER_SUPPORT_EMAIL"
]

# Keys that are required in production environment only
# and they should be stored in .env.production file
production_required_keys = [
  "RAILS_SERVE_STATIC_FILES"
]

required_keys = [*common_required_keys]

if Rails.env.production?
  required_keys.concat(production_required_keys)
end

Dotenv.require_keys(required_keys)
