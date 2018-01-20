class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
     t.string :title
     t.text   :description
     t.text :date_of_event
     t.string :forum, default: "CSIX"
     t.integer :user_id
     t.timestamps
    end
  end
end
