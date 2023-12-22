# Keys that are required in all environments
# and they should be stored in .env file
required_keys = [
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

Dotenv.require_keys(required_keys)
