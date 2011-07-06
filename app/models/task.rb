class Task < ActiveRecord::Base
  attr_accessible :user_id, :customer_id, :description, :due, :priority, :status, :period

  belongs_to :user
  belongs_to :customer

  validates_presence_of :user_id, :customer_id, :description, :due, :priority, :status, :period

  after_create :send_notification
  after_update :send_updated_notification
  after_destroy :send_deleted_notification

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

  def send_notification
    EventMailer.send_task(self).deliver
  end

  def send_updated_notification
    if self.changed?
      EventMailer.send_updated_task(self).deliver
      notify_admins if self.status == 'Completed'
    end
  end

  def send_deleted_notification
    EventMailer.send_deleted_task(self).deliver
  end

  def notify_admins
    User.admins.each do |admin|
      EventMailer.send_to_admin(self, admin).deliver
    end
  end

end
