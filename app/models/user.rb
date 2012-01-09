class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable

  has_many :events
  has_many :activities, :through => :events
  has_many :days

  validates_presence_of :first_name, :last_name, :email

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

  def self.challenge_day
    ((Time.now.utc + Time.zone_offset('CST')).to_date - Settings.start_date.to_date).to_i
  end

  def total_points
    days.map(&:score).sum
  end

  def todays_points
    points_for_date(Date.today)
  end

  def daily_average
    daily_scores = days.map(&:score)
    daily_scores.inject{ |sum, el| sum + el }.to_f / User.challenge_day
  end

  def points_for_date(date)
    score = 0
    Activity.all.each do |activity|
      score += activity.score_for_user_and_date( self, date )
    end
    score
  end

end
