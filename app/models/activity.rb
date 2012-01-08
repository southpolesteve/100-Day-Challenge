class Activity < ActiveRecord::Base
  has_many :users, :through => :events
  has_many :events

  def score_for_user_and_date(user,date)
    score = 0
    user.events.where(:activity => self).where(['created_at > ?', date]) do |event|
      score += event.count*self.value*(score/100 + 1)
    end
    score
  end

end
