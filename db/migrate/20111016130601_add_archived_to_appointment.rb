class AddArchivedToAppointment < ActiveRecord::Migration
  def self.up
    add_column :appointments, :archived, :boolean, :default => 0
  end

  def self.down
    remove_column :appointments, :archived
  end
end
