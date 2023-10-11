require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "saves with valid attributes" do
    todos_count = Todo.count
    todo = FactoryBot.build(:todo)

    expect(todo.save!).to be_truthy
    expect(Todo.count).to eq(todos_count + 1)
  end

  it "does not save without a title" do
    todos_count = Todo.count
    invalid_todo = FactoryBot.build(:todo, title: "")

    expect{ invalid_todo.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
    expect(Todo.count).to eq(todos_count)
  end
end
