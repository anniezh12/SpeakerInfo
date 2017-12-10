class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.string :name
      t.string :location
      t.integer :number_of_speakers
      t.integer :audience
      t.integer :topic_id
      t.timestamps
    end
  end
end
