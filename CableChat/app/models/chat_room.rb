class ChatRoom < ApplicationRecord

  has_many :users, through: :subscribed_chats
  has_many :messages, dependent: :destroy
  has_many :subscribed_chats

end
