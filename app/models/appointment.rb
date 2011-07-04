class Appointment < ActiveRecord::Base
  attr_accessible :user_id, :customer_id, :due, :period, :description, :notes, :status

  belongs_to :user
  belongs_to :customer

  validates_presence_of :user_id, :customer_id, :due, :period, :description, :status

  scope :by_date, lambda { |date| { :conditions => ['due = ?', date] } }
  scope :morning, where(:period => 'Morning')
  scope :afternoon, where(:period => 'Afternoon')
  scope :all_day, where(:period => 'All day')

  STATUS = %w[Confirmed Pending]
  PERIOD = %w[Morning Afternoon All\ day]

end
