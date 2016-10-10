class Goal < ActiveRecord::Base
  validates :title, :body, :user, presence: true
  
  belongs_to :user

  has_many :comments,
  class_name: :GoalComment

end
