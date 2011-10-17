class AddIndexCustomerToTask < ActiveRecord::Migration
  def self.up
    add_index :tasks, :customer_id
  end

  def self.down
    remove_index :tasks, :customer_id
  end
end
