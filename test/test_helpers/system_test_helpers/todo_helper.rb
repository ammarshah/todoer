module TodoHelper
  def incomplete_todos
    "#incomplete-todos li.todo"
  end

  def completed_todos
    "#completed-todos li.todo"
  end

  def find_incomplete_todo(title)
    find(incomplete_todos, text: title)
  end

  def find_completed_todo(title)
    find(completed_todos, text: title)
  end

  def mark_todo_complete(title)
    todo = find_incomplete_todo(title)

    within(todo) do
      status_checkbox.click
    end

    assert_no_selector incomplete_todos, text: title
    assert_selector completed_todos, text: title
  end

  def mark_todo_incomplete(title)
    todo = find_completed_todo(title)

    within(todo) do
      status_checkbox.click
    end

    assert_no_selector completed_todos, text: title
    assert_selector incomplete_todos, text: title
  end

  private

  def status_checkbox
    find(".todo-status-checkbox")
  end
end
