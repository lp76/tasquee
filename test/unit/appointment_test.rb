require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Appointment.new.valid?
  end
end
