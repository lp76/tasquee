class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :customer_id
      t.date :due
      t.string :period
      t.text :description
      t.text :notes
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
