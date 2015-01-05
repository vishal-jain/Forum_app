class AddRolesTable < ActiveRecord::Migration
	def up
		create_table "roles", :force => true do |t|
	      t.string   "name",         :null => false
	      t.string   "display_name"
	      t.datetime "created_at",   :null => false
	      t.datetime "updated_at",   :null => false
	    end
	end
end
