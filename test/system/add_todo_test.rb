require "application_system_test_case"
require "test_helpers/system_test_helpers/todo_helper"

class AddTodoTest < ApplicationSystemTestCase
  include TodoHelper

  def setup
    login(email: users(:default).email)
  end

  test "user adds a todo with a title" do
    add_todo("Buy bread")

    assert_selector incomplete_todos, text: "Buy bread"
  end

  test "user adds a todo without a title" do
    add_todo(" ")

    assert_text title_cant_be_blank_message
    assert_empty all(incomplete_todos)
  end

  test "user adds a todo with a 1000-character title" do
    title_1000 = "A" * 1000
    add_todo(title_1000)

    assert_selector incomplete_todos, text: title_1000
  end

  test "user adds a todo with a 1001-character title" do
    title_1001 = "A" * 1001
    add_todo(title_1001)

    assert_text title_is_too_long_message
    assert_empty all(incomplete_todos)
  end

  test "user adds a todo with title containing extra spaces" do
    add_todo("   Buy    bread ")

    assert_selector incomplete_todos, text: "Buy bread"
  end

  test "user pastes a multi-line title" do
    multiline_title = "Buy \n\nbread"

    paste_title(multiline_title)

    assert_selector title_field, text: "Buy bread"
  end

  private

  def title_field
    "#add-todo .todo-title"
  end

  def add_todo(title)
    find(title_field).set(title)
    find("#todo-submit").click
  end

  # Since Capybara doesn't natively support clipboard we have
  # to temporarily set the text somewhere on the page and then
  # copy to clipboard from there by sending keyboard shortcut keys
  def copy_to_clipboard(text)
    page.execute_script(<<~JS, text)
      const textarea = Object.assign(document.createElement('textarea'), {
        id: 'clipboard-source',
        style: 'position: fixed; top: 0;',
        rows: 4,
        value: arguments[0]
      });

      document.body.appendChild(textarea);
    JS

    find("#clipboard-source").click
    send_keys(:control, "a", "c")

    page.execute_script("document.getElementById('clipboard-source')?.remove();")
  end

  def paste_title(title)
    copy_to_clipboard(title)
    find(title_field).click
    send_keys(:control, "v")
  end
end
