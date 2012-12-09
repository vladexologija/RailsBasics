class User < ActiveRecord::Base
  attr_accessible  :username, :password, :preferences
  serialize :preferences, Hash
end
