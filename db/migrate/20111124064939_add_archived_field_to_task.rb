class AddArchivedFieldToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :archived, :boolean, :default => 0
  end

  def self.down
    remove_column :tasks, :archived
  end
end
