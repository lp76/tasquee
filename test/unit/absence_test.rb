# == Schema Information
#
# Table name: absences
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  day        :date
#  start_time :time(255)
#  end_time   :time(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AbsenceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
