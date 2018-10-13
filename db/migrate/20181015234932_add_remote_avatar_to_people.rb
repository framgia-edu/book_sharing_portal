class AddRemoteAvatarToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :remote_avatar, :string
  end
end
