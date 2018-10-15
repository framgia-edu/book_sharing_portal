class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.references :person, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :rating
      t.string :comment
      t.string :type
      
      t.timestamps
    end
  end
end
