class CreateApproachments < ActiveRecord::Migration[7.2]
  def change
    create_table :approachments do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :subject, null: false
      t.text :message, null: false

      t.timestamps
    end

    add_index :approachments, :email
  end
end
