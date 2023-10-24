ParameterType(
  name:        'message',
  regexp:      /message indicating that (.+)/,
  transformer: ->(text) { message_for(text) }
)
