# == Schema Information
#
# Table name: customers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :string(255)
#  phone      :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Customer.new.valid?
  end
end
