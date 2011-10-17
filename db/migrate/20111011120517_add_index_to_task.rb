class AddIndexToTask < ActiveRecord::Migration
  def self.up
    add_index :tasks, :user_id
  end

  def self.down
    remove_index :tasks, :user_id
  end
end
