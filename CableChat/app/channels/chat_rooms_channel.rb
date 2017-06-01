class ChatRoomsChannel < ApplicationCable::Channel

  # called from JS through the CABLE
  # this tells redis what to do
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
    OnlineUser.new(user_id: current_user.id).save
  end

  def unsubscribed
    OnlineUser.find_by(user_id: current_user.id).delete
    # Any cleanup needed when channel is unsubscribed
    # stop_all_streams

  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end
end
