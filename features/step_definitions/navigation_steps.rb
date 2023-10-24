# SHARED BLOCKS
visit_page = lambda do |path|
  visit path
end

# GIVEN
Given('I am on {page}', visit_page)

# WHEN
When('I go to {page}', visit_page)
