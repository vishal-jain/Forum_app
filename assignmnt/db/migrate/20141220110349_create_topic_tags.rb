class CreateTopicTags < ActiveRecord::Migration
  def change
    create_table :topic_tags do |t|
      t.integer :topic_id
      t.integer :tag_id
    end
  end
end
