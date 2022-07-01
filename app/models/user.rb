class User < ApplicationRecord 
  validates_presence_of :username, :email
  validates_uniqueness_of :email
  validates_presence_of :password_digest, required: true
  has_secure_password

  has_many :locations

  def send_daily_sms


  end 

end