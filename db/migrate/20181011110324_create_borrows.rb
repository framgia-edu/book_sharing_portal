class CreateBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :borrows do |t|
      t.date :borrow_at
      t.date :deadline_at
      t.integer :status, null: false, default: 0
      t.references :user, index: true
      t.references :book , index: true

      t.timestamps
    end
  end
end
