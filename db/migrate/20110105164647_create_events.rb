class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :event_dt
      t.string :title
      t.text :description
    end
  end

  def self.down
    drop_table :events
  end
end
