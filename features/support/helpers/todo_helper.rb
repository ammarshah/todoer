module TodoHelper
  def add_todo(todo)
    add_todo_with(title: todo.title)
  end

  def paste_title(title:)
    within('#add-todo') do
      find('.todo-title').set(title) # Set the multi-line title somewhere on the page
      send_keys [:control, 'a', 'c', 'v'] # Select all ('a'), then copy ('c'), then paste ('v')
    end
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

  def update_incomplete_todo_title(title:, new_title:)
    within('ul#incomplete-todos') do
      find('li', text: title)
        .find('.todo-title')
        .set(new_title)

      send_keys [:enter]
    end
  end

  def update_completed_todo_title(title:, new_title:)
    within('ul#completed-todos') do
      find('li', text: title)
        .find('.todo-title')
        .set(new_title)

      send_keys [:enter]
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
