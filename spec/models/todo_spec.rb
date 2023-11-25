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
  end
end
