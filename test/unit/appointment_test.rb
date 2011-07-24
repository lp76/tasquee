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
#

require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Appointment.new.valid?
  end
end
