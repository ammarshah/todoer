# GIVEN
Given('I (should )have {int} todo(s) in the incomplete todos list') do |todos_count|
  expect(page.find('ul#incomplete-todos')).to have_css('li', count: todos_count)
end

# WHEN
When('I add(ed) a todo with the title {string}') do |title|
  todo = build(:todo, title: title, user: current_user)

  add_todo(todo)
end

When('I add a todo with a {int}-character title') do |title_length|
  todo = build(:todo, title: 'A' * title_length, user: current_user)

  add_todo(todo)
end

# Since there is no easy way to use clipboard with Capybara,
# we are simply doing copy and paste by sending keyboard shortcut keys
When('I paste a multi-line title') do |multiline_title|
  paste_title(title: multiline_title)
end

When('I mark(ed) the todo with the title {string} as completed') do |title|
  mark_todo_complete(title: title)
end

When('I mark the todo with the title {string} as incomplete') do |title|
  mark_todo_incomplete(title: title)
end

When('I delete the todo, present in the incomplete todos list, with the title {string}') do |title|
  delete_incomplete_todo(title: title)
end

When('I delete the todo, present in the completed todos list, with the title {string}') do |title|
  delete_completed_todo(title: title)
end

When('I update the todo\'s title, present in the incomplete todos list, from {string} to {string}') do |title, new_title|
  change_incomplete_todo_title(title: title, new_title: new_title)
  press_key(key: 'enter')
end

When('I update the todo\'s title, present in the completed todos list, from {string} to {string}') do |title, new_title|
  change_completed_todo_title(title: title, new_title: new_title)
  press_key(key: 'enter')
end

When('I change the todo\'s title, present in the incomplete todos list, from {string} to {string}') do |title, new_title|
  change_incomplete_todo_title(title: title, new_title: new_title)
end

# THEN
Then('I should see a todo with the title {string} in the incomplete todos list') do |title|
  expect(page.find('ul#incomplete-todos')).to have_css('li', text: title)
end

Then('I/he should not see a todo with the title {string} in the incomplete todos list') do |title|
  expect(page.find('ul#incomplete-todos')).not_to have_css('li', text: title)
end

Then('I should see a todo with the title {string} in the completed todos list') do |title|
  expect(page.find('ul#completed-todos')).to have_css('li', text: title)
end

Then('I should not see a todo with the title {string} in the completed todos list') do |title|
  expect(page.find('ul#completed-todos')).not_to have_css('li', text: title)
end

Then('I should see an auto-squished title as {string}') do |squished_title|
  expect(page.find('#add-todo')).to have_css('.todo-title', text: squished_title)
end
