require "application_system_test_case"
require "test_helpers/builders/todo_builder"
require "test_helpers/system_test_helpers/todo_helper"

class EditTodoTest < ApplicationSystemTestCase
  include TodoBuilder
  include TodoHelper

  def setup
    @title = "Buy bread"
    @new_title = "Buy bread and butter"

    create_todo(title: @title)

    login(email: users(:default).email)
  end

  test "user presses enter while editing a todo" do
    edit_incomplete_todo_and_save(title: @title, new_title: @new_title)

    assert_selector incomplete_todos, text: @new_title
  end

  test "user presses enter while editing an invalid todo with valid data" do
    edit_incomplete_todo_and_save(title: @title, new_title: " ")
    assert_text title_cant_be_blank_message

    edit_incomplete_todo_and_save(title: " ", new_title: @new_title)
    assert_no_text title_cant_be_blank_message
    assert_selector incomplete_todos, text: @new_title
  end

  test "user focuses out of the title field while editing a todo" do
    edit_incomplete_todo_and_focusout(title: @title, new_title: @new_title)

    assert_selector incomplete_todos, text: @new_title
  end

  test "user focuses out of the title field while editing an invalid todo with valid data" do
    edit_incomplete_todo_and_save(title: @title, new_title: " ")
    assert_text title_cant_be_blank_message

    edit_incomplete_todo_and_focusout(title: " ", new_title: @new_title)
    assert_no_text title_cant_be_blank_message
    assert_selector incomplete_todos, text: @new_title
  end

  test "user presses escape key while editing a todo" do
    edit_incomplete_todo_and_cancel(title: @title, new_title: @new_title)

    assert_selector incomplete_todos, text: @title
  end

  test "user presses escape key while editing an invalid todo" do
    edit_incomplete_todo_and_save(title: @title, new_title: " ")
    assert_text title_cant_be_blank_message

    send_keys(:escape)
    assert_no_text title_cant_be_blank_message
    assert_selector incomplete_todos, text: @title
  end

  test "user cannot edit a completed todo" do
    mark_todo_complete(@title)

    assert_completed_todo_as_non_editable
  end

  private

  def title_field
    ".todo-title"
  end

  def edit_incomplete_todo(title:, new_title:)
    todo = find_incomplete_todo(title)

    within(todo) do
      find(title_field).set(new_title)
    end
  end

  def edit_incomplete_todo_and_save(title: title, new_title: new_title)
    edit_incomplete_todo(title: title, new_title: new_title)
    send_keys(:enter)
  end

  def edit_incomplete_todo_and_focusout(title: title, new_title: new_title)
    edit_incomplete_todo(title: title, new_title: new_title)
    send_keys(:tab)
  end

  def edit_incomplete_todo_and_cancel(title: title, new_title: new_title)
    edit_incomplete_todo(title: title, new_title: new_title)
    send_keys(:escape)
  end

  def assert_completed_todo_as_non_editable
    todo = find_completed_todo(@title)
    title = todo.find(title_field)

    assert_nil title["contenteditable"]
  end
end
