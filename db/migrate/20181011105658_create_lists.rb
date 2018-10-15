class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :book , foreign_key: true
      t.integer :info_id
      t.string :info_type

      t.timestamps
    end
    add_index :lists, [:info_id, :info_type, :book_id]
  end
end
