ParameterType(
  name:        'text',
  regexp:      /(.+)/,
  transformer: -> (text) { message_for(text) }
)
