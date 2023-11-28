# WHEN
When('I press {string} key') do |key|
  press_key(key: key)
end

When('I focus out of the field') do
  trigger_blur
end
