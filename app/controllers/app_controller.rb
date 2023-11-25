class AppController < ApplicationController
  before_action :authenticate_user!

  def index
    @new_todo = Todo.new
    @todos = current_user.todos
  end
end
