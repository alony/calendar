class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email, :null => false
      t.date :birthday
      t.string :crypted_password, :null => false 
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.string :perishable_token, :null => false
    end
  end

  def self.down
    drop_table :users
  end
end
