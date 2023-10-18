# SHARED BLOCKS
visit_page = lambda do |path|
  visit path
end

# GIVEN
Given('I am on the {page} page', visit_page)

# WHEN
When('I go to the {page} page', visit_page)
