class Comment < ActiveRecord::Base
  attr_accessible :description ,:user_id ,:topic_id

  belongs_to :topic
  belongs_to :user

  def user_details
  	self.user.email rescue ''
  end
end
