
class AppearanceChannel < ApplicationCable::Channel


      # def subscribed
      #   @connection_token = generate_connection_token
      # end
      #
      # def unsubscribed
      #   current_user.disappear @connection_token
      # end
      #
      # def appear(data)
      #   current_user.appear @connection_token, on: data['appearing_on']
      # end
      #
      # def disappear
      #   current_user.disappear @connection_token
      # end
      #
      # def away
      #   current_user.away @connection_token
      # end
      #
      # private
      #   def generate_connection_token
      #     SecureRandom.hex(36)
      #   end





  def subscribed
    # current_user.online = true
    # current_user.save
  end


  def unsubscribed
    # current_user.online = false
    # current_user.save
  end


  def appear
    # OnlineUser.new(user_id: current_user.id).save
  end


  def disappear
    # OnlineUser.find_by(user_id: current_user.id).delete
  end


end
