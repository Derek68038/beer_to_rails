# Class: User
#
# Creates new user records for users table in beer wiki database.
# 
# Attributes:
# @user       - String: the username.
# @password   - String: the user's password. 
#
# Public Methods:
# None
#
# Private Methods:
# None

class User < ActiveRecord::Base
  attr_accessible :username, :password
    
  validates :username, presence: true
  validates :password, presence: true
      
end