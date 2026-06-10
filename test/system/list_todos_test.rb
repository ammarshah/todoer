require "application_system_test_case"
require "test_helpers/builders/todo_builder"
require "test_helpers/system_test_helpers/todo_helper"

class ListTodosTest < ApplicationSystemTestCase
  include TodoBuilder
  include TodoHelper

  def setup
    @first_todo = create_todo(title: "First todo")
    @second_todo = create_todo(title: "Second todo")
  end

  test "user does not see other users todos" do
    other_user = create_user

    login(email: other_user.email)

    assert_empty all(incomplete_todos)
  end

  test "user adds a new todo and sees it at the bottom of the incomplete todos list" do
    login(email: users(:default).email)

    assert_text all(incomplete_todos).last, @second_todo.title
  end

  test "user marks a todo as incomplete and sees it at the bottom of the incomplete todos list" do
    login(email: users(:default).email)

    mark_todo_complete(@first_todo.title)
    mark_todo_incomplete(@first_todo.title)

    assert_text all(incomplete_todos).last, @first_todo.title
  end

  test "user marks a todo as completed and sees it at the top of the completed todos list" do
    login(email: users(:default).email)

    mark_todo_complete(@first_todo.title)
    mark_todo_complete(@second_todo.title)

    assert_text all(completed_todos).first, @second_todo.title
  end
end
