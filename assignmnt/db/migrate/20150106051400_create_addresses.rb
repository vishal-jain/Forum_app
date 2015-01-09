class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :pincode
      t.string :country
      t.string :type
      t.integer :forum_id
      t.timestamps
    end
  end
end
