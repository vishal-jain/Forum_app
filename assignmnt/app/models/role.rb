class Role < ActiveRecord::Base
  attr_accessible :display_name, :name

has_many :user_roles, :dependent => :destroy
  has_many :users, :through => :user_roles

end
