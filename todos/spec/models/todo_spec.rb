require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe "validations" do
    context "with title" do
      it "saves successfully" do
        todos_count = Todo.count
        create(:todo)

        expect(Todo.count).to eq(todos_count + 1)
      end
    end

    context "without title" do
      it "does not save successfully" do
        todos_count = Todo.count
        invalid_todo = build(:todo, title: "")

        expect{ invalid_todo.save! }.to raise_error(ActiveRecord::RecordInvalid)
        expect(Todo.count).to eq(todos_count)
      end
    end
  end
end
