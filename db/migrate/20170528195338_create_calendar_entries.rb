class CreateCalendarEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_entries do |t|
      t.integer :user_id
      t.integer :event_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps

    end
  end
end
