class User < ActiveRecord::Base
	has_many :favorited_adventuresexi
	has_many :adventures, through: :favorited_adventures

	has_secure_password
	validates :email, presence: true, uniqueness: true

	
end
