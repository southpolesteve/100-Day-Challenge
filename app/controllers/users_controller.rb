class UsersController < ApplicationController

  def dashboard
    @leaderboard_users = User.all.sort_by(&:total_points)
    @recent_events = current_user.events.order('created_at DESC').limit(5)
    @new_event = Event.new(:user => current_user)
  end

end
