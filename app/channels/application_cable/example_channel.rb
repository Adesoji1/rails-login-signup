# app/channels/application_cable/example_channel.rb
class ApplicationCable::ExampleChannel < ApplicationCable::Channel
    def subscribed
      stream_from "new_user"
    end
  end
  