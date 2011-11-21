class ChangeAbsenceStartEndTime < ActiveRecord::Migration
  def self.up
    change_column :absences, :start_time, :time
    change_column :absences, :end_time, :time
  end

  def self.down
    change_column :absences, :start_time, :string
    change_column :absences, :end_time, :string
  end
end
