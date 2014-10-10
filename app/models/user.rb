require 'bcrypt'

class User

	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :user_name, String
	property :email, String
	property :password_digest, Text

	def password=(password)
		@password = password
	    self.password_digest = BCrypt::Password.create(password)
	end

	validates_confirmation_of :password
    validates_uniqueness_of :email
    validates_uniqueness_of :user_name

end