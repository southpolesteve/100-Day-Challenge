class Activity < ActiveRecord::Base
  has_many :users, :through => :events
  has_many :events

  def score_for_user_and_date(user,date)
    gross_score = events.where(:user_id => user.id, :completed_date => date).map{ |event| event.count*self.value }.sum
    unless name == "alcohol"
      hundreds = gross_score/100
      adjusted_score = 0
      (hundreds+1).times do
        if gross_score > 100
          adjusted_score = adjusted_score + 100
          gross_score = (gross_score - 100)/2
        else
          adjusted_score = adjusted_score + gross_score
          gross_score = 0
        end
      end
      adjusted_score
    else
      gross_score
    end
  end

end
