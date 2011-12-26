class UsersController < ApplicationController

  def dashboard
    @new_event = Event.new(:user => current_user)
  end

end
