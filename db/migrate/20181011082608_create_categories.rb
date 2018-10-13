class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, unique: true
      t.string :description
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
