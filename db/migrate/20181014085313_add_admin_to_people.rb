class AddAdminToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :admin, :boolean, null: false, default: false
  end
end
