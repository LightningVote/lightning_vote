class CreateEventTalks < ActiveRecord::Migration
  def change
    create_table :event_talks do |t|
      t.references :talk, index: true
      t.references :event
      t.timestamps null: false
    end
  end
end
