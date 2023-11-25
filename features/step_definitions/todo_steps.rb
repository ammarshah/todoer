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

# Since there is no easy way to use clipboard with Capybara,
# we are simply doing copy and paste by sending keyboard shortcut keys
When('I paste a multi-line title') do |multiline_title|
  within('#add-todo') do
    find('.todo-title').set(multiline_title) # Set the multi-line title somewhere on the page
  end

  send_keys [:control, 'a', 'c', 'v'] # Select all ('a'), then copy ('c'), then paste ('v')
end

# THEN
Then('I should see a todo with the title {string} in the incomplete todos list') do |title|
  expect(page.find('ul#incomplete-todos')).to have_css('li', text: title)
end

Then('I should see an auto-squished title as {string}') do |squished_title|
  expect(page.find('#add-todo')).to have_css('.todo-title', text: squished_title)
end
