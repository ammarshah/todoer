module TodoBuilder
  def build_todo(**attrs)
    Todo.new(default_todo_attributes.merge(attrs))
  end

  def create_todo(**attrs)
    Todo.create!(default_todo_attributes.merge(attrs))
  end

  def default_todo_attributes
    {
      title: "Buy bread",
      user: users(:default)
    }
  end
end
