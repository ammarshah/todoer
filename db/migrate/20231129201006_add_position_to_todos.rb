class AddPositionToTodos < ActiveRecord::Migration[7.2]
  def change
    add_column :todos, :position, :integer
  end
end
