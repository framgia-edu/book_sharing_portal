class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :introduce
      t.string :cover
      t.string :content, null: false, default: ""
      t.integer :quantity
      t.integer :status , null: false, default: 2
      t.references :user , index: true

      t.timestamps
    end
  end
end
