class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.belongs_to :listable, polymorphic: true
      t.references :book , index: true

      t.timestamps
    end
    add_index :lists, [:listable_id, :listable_type]
  end
end
