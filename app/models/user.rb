class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable

  has_many :events
  has_many :activities, :through => :events

  validates_presence_of :first_name, :last_name, :email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

  def total_points
    all_previous_days = 0
    (1..challenge_day).each do |number|
      all_previous_days += (Rails.cache.fetch('#{id}-#{number}') { points_for_date(Settings.start_date.to_date+(number-1).days) })
    end
    today = points_for_date(Date.today)
    all_previous_days+today
  end

  def challenge_day
    (Date.today - Settings.start_date.to_date).to_i
  end

  def todays_points
    points_for_date(Date.today)
  end

  def points_for_date(date)
    score = 0
    Activity.all.each do |activity|
      score += activity.score_for_user_and_date( self, date )
    end
    score
  end

end
