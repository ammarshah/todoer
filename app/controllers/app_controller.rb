class AppController < ApplicationController
  before_action :authenticate_user!

  def index
    @new_todo = Todo.new
    @incomplete_todos = current_user.todos.incomplete.order(created_at: :asc)
    @completed_todos = current_user.todos.completed
  end
end
