class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
