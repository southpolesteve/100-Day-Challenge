class Event < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  validates_presence_of :user, :activity, :count

end
