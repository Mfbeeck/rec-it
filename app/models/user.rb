class User < ActiveRecord::Base
	has_secure_password
  	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates_uniqueness_of :username
	validates_uniqueness_of :email
end
