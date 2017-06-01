class CreateUsersOnlines < ActiveRecord::Migration[5.0]
  def change
    create_table :users_onlines do |t|
      
      t.timestamps
    end
  end
end
