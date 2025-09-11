# Keys that are required in all environments
# and they should be stored in .env file
required_keys = [
  "SECRET_KEY_BASE",
  "APP_DOMAIN",
  "APP_PORT",
  "SMTP_ADDRESS",
  "SMTP_PORT",
  "SMTP_USERNAME",
  "SMTP_PASSWORD",
  "DEFAULT_FROM_EMAIL",
  "DEFAULT_REPLY_TO_EMAIL",
  "TODOER_SUPPORT_EMAIL"
]

if Rails.env.production?
  production_required_keys = [
    "POSTGRES_HOST",
    "POSTGRES_USERNAME",
    "POSTGRES_PASSWORD",
    "WEB_CONCURRENCY"
  ]

  required_keys = required_keys + production_required_keys
end

Dotenv.require_keys(required_keys)
