ParameterType(
  name:        'page',
  regexp:      /the (.+) page/,
  transformer: ->(page) { path_for(page) }
)
