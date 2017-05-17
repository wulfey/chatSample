class RemoveDestroyFromFriendships < ActiveRecord::Migration[5.0]
  def change
    remove_column :friendships, :create
    remove_column :friendships, :destroy
  end
end
