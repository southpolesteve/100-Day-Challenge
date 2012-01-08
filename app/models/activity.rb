class Activity < ActiveRecord::Base
  has_many :users, :through => :events
  has_many :events

  def daily_score_for_user(user)
    score = 0
    user.events.where(:activity => self).where(['created_at > ?', Date.today]) do |event|
      score += event.count*self.value*(score/100 + 1)
    end
    score
  end

end
