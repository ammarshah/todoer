require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "saves with valid attributes" do
    todo = build(:todo)

    expect { todo.save! }.to change(Todo, :count).by(1)
  end

  it "does not save without a title" do
    invalid_todo = build(:todo, title: nil)

    expect { invalid_todo.save! }.to raise_error("Validation failed: Title can't be blank")
  end
end
