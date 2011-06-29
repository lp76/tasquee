class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :customer_id
      t.text :description
      t.date :due
      t.string :priority
      t.string :status
      t.string :period
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
