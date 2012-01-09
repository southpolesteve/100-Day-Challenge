class UsersController < ApplicationController

  def dashboard
    if current_user
      @leaderboard_users = User.includes(:days).all.sort_by { |u| -u.total_points }
      @recent_events = current_user.events.order('created_at DESC').limit(5)
      @new_event = Event.new(:user => current_user)
    else
      render "not_signed_in"
    end
  end

  def events
    @user = User.find(params[:id])
  end

end
