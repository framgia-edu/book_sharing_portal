class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|

      t.integer :rating
      t.string :comment
      t.string :type, null: false
      t.string :comment, null: false, default: ""
      t.integer :rating, null: false, default: 0
      t.references :user, index: true
      t.references :book , index: true

      t.timestamps
    end

  end
end
