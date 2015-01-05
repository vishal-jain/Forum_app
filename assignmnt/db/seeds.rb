# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	Role.new(:name => "admin" , :display_name => "admin").save!
	Role.new(:name => "forum_admin" , :display_name => "forum_admin").save!
  
  user = User.new(:email => "admin@assign.com",:password => "admin@123", :password_confirmation => "admin@123")
  user.save!
  UserRole.create!({:user_id => user.id, :role_id => Role.find_by_name("admin").try(:id)})
  puts "admin created"



	    forum = Forum.new(:name => "Test forum" , :address => "Nariman point , mumbai" , :email => "forum@test.com")
	     if forum.save!
	     	puts "forums created"
	     	topic = forum.topics.build(:title => "first topic for test forum", :name => "test forum topic" , :description => "test forum's topic" ).save!
	     	puts "Topic created"
	     end

   
   	Tag.new(:name => "test tag" , :description => "these tag is for testing").save!
   	Tag.new(:name => "good" , :description => "these tag is for testing").save!
   	Tag.new(:name => "bad" , :description => "these tag is for testing").save!
   

  user = User.new(:email => "forum_admin@assign.com",:password => "admin@123", :password_confirmation => "admin@123",:forum_id => Forum.first.id)
  user.save!
  UserRole.create!({:user_id => user.id, :role_id => Role.find_by_name("forum_admin").try(:id)})
  puts "forum admin created"

  user = User.new(:email => "abc@assign.com",:password => "admin@123", :password_confirmation => "admin@123")
  user.save!
  puts "normal user created"


