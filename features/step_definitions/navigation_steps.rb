# GIVEN
Given('I am on the {page} page') do |path|
  visit path
end

# WHEN
When('I go to the {page} page') do |path|
  visit path
end
