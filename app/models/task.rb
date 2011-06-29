class Task < ActiveRecord::Base
  attr_accessible :user_id, :customer_id, :description, :due, :priority, :status, :period

  belongs_to :user
  belongs_to :customer

  validates_presence_of :user_id, :customer_id, :description, :due, :priority, :status, :period

  scope :completed, where(:status => 'Completed')
  scope :active, where(:status => 'Active')
  scope :pending, where(:status => 'Pending')
  scope :by_date, lambda { |date| { :conditions => ['due = ?', date] } }
  scope :morning, where(:period => 'Morning')
  scope :afternoon, where(:period => 'Afternoon')
  scope :all_day, where(:period => 'All day')

  PRIORITY = %w[High Medium Normal]
  STATUS = %w[Active Pending Completed]
  PERIOD = %w[Morning Afternoon All\ day]

end
