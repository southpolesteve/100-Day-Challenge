class Event < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  validates_presence_of :user, :activity, :count, :completed_date

  after_save :update_score
  before_destroy :update_score

  def update_score
    day = user.days.find_or_create_by_date(completed_date)
    day.score = user.points_for_date(completed_date)
    day.save
  end


end
