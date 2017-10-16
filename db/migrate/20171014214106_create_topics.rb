class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
     t.string :title
     t.text   :description
     t.datetime :date_of_event
     t.integer :user_id
     t.timestamps
    end
  end
end
