module TodoHelper
  def add_todo(todo)
    add_todo_with(title: todo.title)
  end

  private

  def add_todo_with(title:)
    within("#add-todo") do
      find(".todo-title").set(title)
      find("#todo-submit").click
    end
  end
end

World(TodoHelper)
