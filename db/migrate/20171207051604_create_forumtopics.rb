class CreateForumtopics < ActiveRecord::Migration[5.1]
  def change
    create_table :forumtopics do |t|
      t.integer :forum_id
      t.integer :topic_id
      t.integer :ratings
      t.timestamps
    end
  end
end
