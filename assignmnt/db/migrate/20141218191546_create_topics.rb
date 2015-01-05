class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :name
      t.text :description
      t.string :permalink
      t.integer :forum_id
      t.timestamps
    end
  end
end
