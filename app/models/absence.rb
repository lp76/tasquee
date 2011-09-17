# == Schema Information
#
# Table name: absences
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  day        :date
#  start_time :string(255)
#  end_time   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Absence < ActiveRecord::Base
  attr_accessible :user_id, :day, :start_time, :end_time

  belongs_to :user

  validates_presence_of :user_id, :day, :start_time, :end_time
end
