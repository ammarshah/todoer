require 'rails_helper'

RSpec.describe Todo, type: :model do
  context "when validating user before saving" do
    it "saves with valid attributes" do
      todo = build(:todo)

      expect { todo.save! }.to change(Todo, :count).by(1)
    end

    context "for title attribute" do
      it "does not save without a title" do
        invalid_todo = build(:todo, title: "")

        expect { invalid_todo.save! }.to raise_error("Validation failed: Title can't be blank")
      end

      it "does not save if title has more than 1000 characters" do
        todo_with_valid_title = build(:todo, title: "Title with 1000 characters#{'s' * 974}")
        todo_with_invalid_title = build(:todo, title: "Title with 1001 characters#{'s' * 975}")

        expect { todo_with_valid_title.save! }.not_to raise_error
        expect { todo_with_invalid_title.save! }.to raise_error("Validation failed: Title is too long (maximum is 1000 characters)")
      end

      it "auto-squishes the title while saving" do
        todo = create(:todo, title: "    Buy    bread    ")

        expect(todo.title).to eq("Buy bread")
      end
    end

    context "for completed attribute" do
      it "does not save with completed field blank" do
        invalid_todo = build(:todo, completed: "")

        expect { invalid_todo.save! }.to raise_error("Validation failed: Completed is not included in the list")
      end
    end

    context "for user association" do
      it "does not save without a user" do
        invalid_todo = build(:todo, user: nil)

        expect { invalid_todo.save! }.to raise_error("Validation failed: User must exist")
      end
    end
  end

  context "status" do
    it "is by default incomplete" do
      todo = create(:todo)

      expect(todo.completed?).to be_falsy
    end

    it "can be marked as complete" do
      todo = create(:todo)

      todo.completed = true
      todo.save!

      expect(todo.completed?).to be_truthy
    end

    it "can be marked as incomplete" do
      todo = create(:todo, completed: true)

      todo.completed = false
      todo.save!

      expect(todo.completed?).to be_falsy
    end
  end

  describe "#completed" do
    it "returns the completed todos" do
      incomplete_todo = create(:todo)
      completed_todo = create(:todo, :completed)

      expect(Todo.completed).to eq([completed_todo])
    end
  end

  describe "#incomplete" do
    it "returns the incomplete todos" do
      incomplete_todo = create(:todo)
      completed_todo = create(:todo, :completed)

      expect(Todo.incomplete).to eq([incomplete_todo])
    end
  end
end
