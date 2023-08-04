# app/channels/new_user_channel.rb

class NewUserChannel < ApplicationCable::Channel
    def subscribed
      stream_from "new_user"
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end
  