class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable

  has_many :events
  has_many :activities, :through => :events

  validates_presence_of :first_name, :last_name

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def total_points
    events.map{ |event| event.count*event.activity.value }.sum
  end

end
