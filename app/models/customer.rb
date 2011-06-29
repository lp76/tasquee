class Customer < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :email

  has_many :tasks
  has_many :appointments

  validates_presence_of :name
  validates_uniqueness_of :name
end
