class Activity < ActiveRecord::Base
  has_many :users, :through => :events
  has_many :events

end
