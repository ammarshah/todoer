module TodoHelper
  def add_todo(todo)
    add_todo_with(title: todo.title)
  end

  def mark_todo_complete(title:)
    within('ul#incomplete-todos') do
      find('li', text: title)
        .find('.todo-status-checkbox')
        .click
    end
  end

  def mark_todo_incomplete(title:)
    within('ul#completed-todos') do
      find('li', text: title)
        .find('.todo-status-checkbox')
        .click
    end
  end

  def delete_incomplete_todo(title:)
    within('ul#incomplete-todos') do
      find('li', text: title)
        .hover
        .find('.todo-actions .delete')
        .click
    end
  end

  def delete_completed_todo(title:)
    within('ul#completed-todos') do
      find('li', text: title)
        .hover
        .find('.todo-actions .delete')
        .click
    end
  end

  private

  def add_todo_with(title:)
    within('#add-todo') do
      find('.todo-title').set(title)
      find('#todo-submit').click
    end
  end
end

World(TodoHelper)
