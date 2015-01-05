class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :permalink

      t.timestamps
    end
  end
end
