class Event < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user

  validate_presence_of :user, :activity, :count

end
