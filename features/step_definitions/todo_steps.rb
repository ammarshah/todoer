# GIVEN
Given('I (should )have {int} todo(s) in the incomplete todos list') do |todos_count|
  expect(page.find('ul#incomplete-todos')).to have_css('li', count: todos_count)
end

# WHEN
When('I add a todo with the title {string}') do |title|
  todo = build(:todo, title: title)

  add_todo(todo)
end

When('I add a todo with a {int}-character title') do |title_length|
  todo = build(:todo, title: 'A' * title_length)

  add_todo(todo)
end

# THEN
Then('I should see a todo with the title {string} in the incomplete todos list') do |title|
  expect(page.find('ul#incomplete-todos')).to have_css('li', text: title)
end
