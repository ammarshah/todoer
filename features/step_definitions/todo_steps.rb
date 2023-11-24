# WHEN
When('I add a todo with the title {string}') do |title|
  add_todo_with(title: title)
end

# THEN
Then('I should see a todo with the title {string} in the incomplete todos list') do |title|
  expect(page).to have_css('ul#incomplete-todos li', text: title)
end
