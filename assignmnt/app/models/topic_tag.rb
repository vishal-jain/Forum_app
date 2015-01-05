class TopicTag < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :topic
  belongs_to :tag
end
