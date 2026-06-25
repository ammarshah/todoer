require "application_system_test_case"
require "test_helpers/builders/todo_builder"
require "test_helpers/system_test_helpers/todo_helper"

class DeleteTodoTest < ApplicationSystemTestCase
  include TodoBuilder
  include TodoHelper

  def setup
    @title = "Buy bread"

    create_todo(title: @title)

    login(email: users(:default).email)
  end

  test "user deletes an incomplete todo" do
    todo = find_incomplete_todo(@title)

    delete_todo(todo)

    assert_no_selector incomplete_todos, text: @title
  end

  test "user deletes a completed todo" do
    mark_todo_complete(@title)

    todo = find_completed_todo(@title)
    delete_todo(todo)

    assert_no_selector completed_todos, text: @title
  end

  private

  def delete_todo(todo)
    todo.hover

    within(todo) do
      find(".todo-actions .delete").click
    end
  end
end
