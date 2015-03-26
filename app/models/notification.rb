class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :requester, class_name: "User"
  validates :title, presence: true
  validates :body, presence: true
end
