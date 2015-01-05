class Tag < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :topic_tags
  has_many :topics , :through => :topic_tags

  # has_many :comment_tags
  # has_many :comments, :through => :comment_tags 
end
