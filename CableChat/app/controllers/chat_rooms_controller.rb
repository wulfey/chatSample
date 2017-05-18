class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room created!'
      redirect_to request.referer
    else
      render 'new'
    end
  end


  def subscribed
    @subscribed = current_user.chat_rooms
  end

  def add
    @chat_room = ChatRoom.find_by(params[:id])
    if current_user.chat_rooms.include?(@chat_room)
      flash[:failure] = 'Already subscribed'
    else
      current_user.chat_rooms << @chat_room
      current_user.save
      flash[:success] = 'Chat room added to subscribed rooms.'
    end
    redirect_to request.referer
  end

  def unsubscribe
    @chat_room = ChatRoom.find_by(params[:id])
    current_user.chat_rooms.delete(@chat_room)
    @chat_room.save
    flash[:success] = 'Chat room removed!'
    redirect_to request.referer
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
