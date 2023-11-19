class AppController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo = Todo.new
  end
end
