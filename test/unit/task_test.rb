# == Schema Information
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  customer_id :integer
#  description :text
#  due         :date
#  priority    :string(255)
#  status      :string(255)
#  period      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Task.new.valid?
  end
end
