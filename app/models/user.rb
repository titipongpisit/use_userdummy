require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true 
  validates :password_digest, presence: true
  # Remember to create a migration!
end
