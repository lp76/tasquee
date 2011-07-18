class Holiday < ActiveRecord::Base
  attr_accessible :user_id, :start_date, :end_date

  belongs_to :user

  validates_presence_of :user_id, :start_date, :end_date
end
