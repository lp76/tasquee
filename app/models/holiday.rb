# == Schema Information
#
# Table name: holidays
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

class Holiday < ActiveRecord::Base
  attr_accessible :user_id, :start_date, :end_date

  belongs_to :user

  validates_presence_of :user_id, :start_date, :end_date

end
