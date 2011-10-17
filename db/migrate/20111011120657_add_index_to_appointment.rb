class AddIndexToAppointment < ActiveRecord::Migration
  def self.up
    add_index :appointments, :user_id
    add_index :appointments, :customer_id
  end

  def self.down
    remove_index :appointments, :user_id
    remove_index :appointments, :customer_id
  end
end
