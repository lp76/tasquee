class AddShowInCalendarToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :show_in_calendar, :boolean
  end

  def self.down
    remove_column :users, :show_in_calendar
  end
end
