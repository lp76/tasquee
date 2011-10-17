class AddIndexToAbsence < ActiveRecord::Migration
  def self.up
    add_index :absences, :user_id
  end

  def self.down
    remove_index :absences, :user_id
  end
end
