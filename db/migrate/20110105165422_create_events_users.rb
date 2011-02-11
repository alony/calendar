class CreateEventsUsers < ActiveRecord::Migration
  def self.up
    create_table :events_users, :id => false do |t|
      t.references :user, :null => false
      t.references :event, :null => false
    end
    
    add_index :events_users, :event_id
  end

  def self.down
    drop_table :events_users
  end
end
