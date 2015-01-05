class AddUserRolesTable < ActiveRecord::Migration

	def up
	    create_table "user_roles", :force => true do |t|
	      t.integer  "user_id",     :null => false
	      t.integer  "role_id",     :null => false
	      t.datetime "created_at",  :null => false
	      t.datetime "updated_at",  :null => false
	    end
	end
end
