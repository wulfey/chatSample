class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
    mes = []
    current_user.chat_rooms.each do |room|
      room.messages.each do |message|
        mes << message
      end
    end

    @messages = mes.sort {|a,b| a.created_at <=> b.created_at}

  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    @chat_room.owner_id = current_user.id
    if @chat_room.save
      flash[:success] = 'Chat room created!'
    else
      render 'new'
    end
    redirect_to root_path
  end


  def subscribed
    @subscribed = current_user.chat_rooms
  end

  def add
    @chat_room = ChatRoom.find_by(id: params[:id])
    if current_user.chat_rooms.include?(@chat_room)
      flash[:failure] = 'Already subscribed'
    elsif @chat_room == nil
      flash[:failure] = 'Error nil room'
    else
      current_user.chat_rooms << @chat_room
      current_user.save
      flash[:success] = 'Chat room added to subscribed rooms.'
    end
    redirect_back(fallback_location: root_path)
  end

  def unsubscribe
    @chat_room = ChatRoom.find_by(id: params[:id])
    current_user.chat_rooms.delete(@chat_room)
    current_user.save
    flash[:success] = 'Chat room removed!'
    redirect_back(fallback_location: root_path)
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  # DELETE /chat_rooms/1
  # DELETE /chat_rooms/1.json
  def destroy
    @chat_room = ChatRoom.find_by(id: params[:id])
    if current_user.id != @chat_room.owner_id
      flash[:failure] = "Cannot delete chat room, you are not the owner."
      redirect_back(fallback_location: root_path)
    else
      @chat_room.destroy
      flash[:notice] = "Destroyed Chat Room."
      redirect_back(fallback_location: root_path)
    end


  end



  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :id)
  end
end
