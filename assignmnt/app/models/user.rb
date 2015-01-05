class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation, :name, :remember_me, :forum_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #before_action :authenticate_user!

  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
  has_one :comments
  belongs_to :forum

 #after_create :set_default_role

  def role?(role)
    if role.instance_of?Array
      return !self.roles.where(:name => role).empty?
    else
      return !!self.roles.find_by_name(role.to_s)
    end
  end

end
