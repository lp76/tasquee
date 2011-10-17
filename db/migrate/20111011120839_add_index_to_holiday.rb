class AddIndexToHoliday < ActiveRecord::Migration
  def self.up
    add_index :holidays, :user_id
  end

  def self.down
    remove_index :holidays, :user_id
  end
end
