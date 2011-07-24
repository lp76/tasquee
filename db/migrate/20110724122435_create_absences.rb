class CreateAbsences < ActiveRecord::Migration
  def self.up
    create_table :absences do |t|
      t.integer :user_id
      t.date :day
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :absences
  end
end
