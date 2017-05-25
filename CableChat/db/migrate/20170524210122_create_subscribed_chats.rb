class CreateSubscribedChats < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribed_chats do |t|
      t.integer :user_id
      t.integer :chat_room_id
      t.timestamps
    end
  end
end
