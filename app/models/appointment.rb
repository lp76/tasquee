# == Schema Information
#
# Table name: appointments
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  customer_id :integer
#  due         :date
#  period      :string(255)
#  description :text
#  notes       :text
#  status      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  archived    :boolean         default(FALSE)
#

class Appointment < ActiveRecord::Base
  attr_accessible :user_id, :customer_id, :due, :period, :description, :notes, :status

  belongs_to :user
  belongs_to :customer

  validates_presence_of :user_id, :customer_id, :due, :period, :description, :status

  after_create :send_notification
  after_update :send_updated_notification
  after_destroy :send_deleted_notification

  scope :by_date, lambda { |date| { :conditions => ['due = ?', date] } }
  scope :morning, where(:period => 'Morning')
  scope :afternoon, where(:period => 'Afternoon')
  scope :all_day, where(:period => 'All day')

  default_scope :order => 'due'

  STATUS = %w[Confirmed Pending]
  PERIOD = %w[Morning Afternoon All\ day]

  def send_notification
    EventMailer.send_appointment(self).deliver
  end

  def send_updated_notification
    EventMailer.send_updated_appointment(self).deliver if self.changed?
  end

  def send_deleted_notification
    EventMailer.send_deleted_appointment(self).deliver
  end

end
