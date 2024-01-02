# SHARED METHODS
def app_page
  AppPage.new
end

def add_todo(todo)
  app_page.add_todo(todo)
end

def add_todo_form
  app_page.add_todo_form
end

def incomplete_todos_list
  app_page.incomplete_todos_list
end

def completed_todos_list
  app_page.completed_todos_list
end

# GIVEN
Given('I (should )have {int} todo(s) in the incomplete todos list') do |todos_count|
  expect(incomplete_todos_list.todos).to have_count_of(todos_count)
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

When('I paste a multi-line title') do |multiline_title|
  add_todo_form.paste_title(multiline_title)
end

When('I mark(ed) the todo with the title {string} as completed') do |title|
  incomplete_todos_list.todo_matching(text: title).mark_complete
end

When('I mark the todo with the title {string} as incomplete') do |title|
  completed_todos_list.todo_matching(text: title).mark_incomplete
end

When('I delete the todo, present in the incomplete todos list, with the title {string}') do |title|
  incomplete_todos_list.todo_matching(text: title).delete
end

When('I delete the todo, present in the completed todos list, with the title {string}') do |title|
  completed_todos_list.todo_matching(text: title).delete
end

When('I update(d) the todo\'s title, present in the incomplete todos list, from {string} to {string}') do |title, new_title|
  incomplete_todos_list.update_todo_title(from: title, to: new_title)
end

When('I update the todo\'s title, present in the completed todos list, from {string} to {string}') do |title, new_title|
  completed_todos_list.update_todo_title(from: title, to: new_title)
end

When('I change the todo\'s title, present in the incomplete todos list, from {string} to {string}') do |title, new_title|
  incomplete_todos_list.change_todo_title(from: title, to: new_title)
end

# THEN
Then('I should see a todo with the title {string} in the incomplete todos list') do |title|
  expect(incomplete_todos_list).to have_todo_matching(text: title)
end

Then('I/he should not see a todo with the title {string} in the incomplete todos list') do |title|
  expect(incomplete_todos_list).not_to have_todo_matching(text: title)
end

Then('I should see the todo with the title {string} as the last item in the incomplete todos list') do |title|
  expect(incomplete_todos_list.todos.last).to have_text(title)
end

Then('I should see a todo with the title {string} in the completed todos list') do |title|
  expect(completed_todos_list).to have_todo_matching(text: title)
end

Then('I should not see a todo with the title {string} in the completed todos list') do |title|
  expect(completed_todos_list).not_to have_todo_matching(text: title)
end

Then('I should see the todo with the title {string} as the first item in the completed todos list') do |title|
  expect(completed_todos_list.todos.first).to have_text(title)
end

Then('I should see a squished title as {string}') do |squished_title|
  expect(add_todo_form.title_field).to have_text(squished_title)
end
