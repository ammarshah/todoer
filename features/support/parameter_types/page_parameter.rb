ParameterType(
  name:        'page',
  regexp:      /(.+)/,
  transformer: -> (name) { path_for(name) }
)
