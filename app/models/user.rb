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
    Activity.all.each do |activity|
    end
  end



end
