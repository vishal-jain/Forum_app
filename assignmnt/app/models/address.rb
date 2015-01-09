class Address < ActiveRecord::Base
  attr_accessible :city, :country, :pincode

  belongs_to :forum
end
