require "test_helper"
require "test_helpers/builders/todo_builder"

class TodoTest < ActiveSupport::TestCase
  include TodoBuilder

  #
  # VALID RECORD
  #
  test "is valid with valid attributes" do
    assert_predicate build_todo, :valid?
  end

  #
  # TITLE
  #
  test "requires title" do
    todo = build_todo(title: "")

    assert_not todo.valid?
    assert todo.errors.added?(:title, :blank)
  end

  test "enforces max title length 1000" do
    valid = build_todo(title: "A" * 1000)
    invalid = build_todo(title: "A" * 1001)

    assert_predicate valid, :valid?
    assert_not invalid.valid?
    assert_equal :too_long, invalid.errors.details[:title].first[:error]
  end

  test "squishes title on validation" do
    todo = build_todo(title: "    Buy    bread    ")

    assert todo.valid?
    assert_equal "Buy bread", todo.title
  end

  #
  # COMPLETED
  #
  test "requires completed to be true or false" do
    todo = build_todo(completed: "")

    assert_not todo.valid?
    assert_equal :inclusion, todo.errors.details[:completed].first[:error]
  end

  #
  # USER
  #
  test "requires user" do
    todo = build_todo(user: nil)

    assert_not todo.valid?
    assert_equal :blank, todo.errors.details[:user].first[:error]
  end

  #
  # STATUS
  #
  test "is incomplete by default" do
    todo = create_todo

    assert_not todo.completed?
  end

  test "can be marked complete" do
    todo = create_todo

    todo.update!(completed: true)

    assert_predicate todo.reload, :completed?
  end

  test "can be marked incomplete" do
    todo = create_todo(completed: true)

    todo.update!(completed: false)

    assert_not todo.reload.completed?
  end

  #
  # .incomplete
  #
  test ".incomplete returns incomplete todos" do
    incomplete_todo = create_todo
    create_todo(completed: true)

    assert_equal [ incomplete_todo ], Todo.incomplete.to_a
  end

  test ".incomplete returns todos ordered by ascending position" do
    todo1 = create_todo(position: 1)
    todo3 = create_todo(position: 3)
    todo2 = create_todo(position: 2)

    assert_equal [ todo1, todo2, todo3 ], Todo.incomplete.to_a
  end

  #
  # .completed
  #
  test ".completed returns completed todos" do
    create_todo

    completed_todo = create_todo(completed: true)

    assert_equal [ completed_todo ], Todo.completed.to_a
  end

  test ".completed returns todos ordered by descending position" do
    todo1 = create_todo(completed: true, position: 1)
    todo3 = create_todo(completed: true, position: 3)
    todo2 = create_todo(completed: true, position: 2)

    assert_equal [ todo3, todo2, todo1 ], Todo.completed.to_a
  end
end
