class AddOmniauthToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :provider, :string
    add_column :people, :uid, :string
  end
end
