# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primary key
#  username         :string(255)
#  email            :string(255)
#  password_hash    :string(255)
#  password_salt    :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  name             :string(255)
#  show_in_calendar :boolean
#  admin            :boolean
#  position         :integer
#

class User < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :name, :username, :email, :password, :password_confirmation, :admin, :show_in_calendar

  acts_as_list

  has_many :tasks
  has_many :appointments
  has_many :holidays
  has_many :absences

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :name, :username, :email
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  scope :in_calendar, where(:show_in_calendar => true)
  scope :admins, where(:admin => true)

  default_scope :order => 'position ASC'

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  def is_admin?
    self.admin ? :yes : :no
  end

  def in_holiday?(date)
    self.holidays.find(:all, :conditions => ["start_date <= ? AND end_date >= ?", date, date]).empty? ? false : true
  end

  def absent?(date)
    self.absences.find(:all, :conditions => ["day = ?", date]).empty? ? false : true
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end
