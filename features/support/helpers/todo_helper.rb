module TodoHelper
  def add_todo(todo)
    app_page.add_todo(todo)
  end

  def add_todo_form
    app_page.add_todo_form
  end

  def incomplete_todos_list
    app_page.todos_list(status: 'incomplete')
  end

  def completed_todos_list
    app_page.todos_list(status: 'completed')
  end

  def incomplete_todos
    incomplete_todos_list.todos
  end

  def completed_todos
    completed_todos_list.todos
  end

  def find_incomplete_todo(title:)
    incomplete_todos_list.todo_matching(text: title)
  end

  def find_completed_todo(title:)
    completed_todos_list.todo_matching(text: title)
  end

  private

  def app_page
    AppPage.new
  end
end

World(TodoHelper)
