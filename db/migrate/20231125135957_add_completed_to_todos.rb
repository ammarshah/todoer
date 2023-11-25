class AddCompletedToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :completed, :boolean, null: false, default: false

    add_index :todos, :completed
  end
end
