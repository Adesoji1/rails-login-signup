# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
  
      if @user.save
        ActionCable.server.broadcast('new_user', @user)
        redirect_to @user
      else
        render :new
      end
    end
  
    # ...
  end
  