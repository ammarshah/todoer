class AddLangToTaglines < ActiveRecord::Migration[7.2]
  def change
    add_column :taglines, :lang, :string, null: false
    add_column :taglines, :lang_code, :string, null: false

    add_index :taglines, :lang
    add_index :taglines, :lang_code
  end
end
