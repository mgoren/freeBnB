class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :listings
  has_many :notifications
  has_many :requesters, class_name: "User", through: :notifications
  # validates :name, presence: true, on: :update

  def notifications_count
    self.notifications.where(read: false).count
  end


end
