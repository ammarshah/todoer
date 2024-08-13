class AddCompletedToTodos < ActiveRecord::Migration[7.2]
  def change
    add_column :todos, :completed, :boolean, null: false, default: false

    add_index :todos, :completed
  end
end
