class UsersController < ApplicationController

  def dashboard
    if current_user
      @leaderboard_users = User.all.sort_by(&:total_points)
      @recent_events = current_user.events.order('created_at DESC').limit(5)
      @new_event = Event.new(:user => current_user)
    else
      render "not_signed_in"
    end
  end

end
