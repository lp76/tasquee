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

class Customer < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :email

  has_many :tasks
  has_many :appointments

  validates_presence_of :name
  validates_uniqueness_of :name
end
