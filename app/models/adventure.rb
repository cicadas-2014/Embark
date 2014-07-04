class Adventure < ActiveRecord::Base
	has_many :category_adventures
	has_many :categories, through: :category_adventures
	belongs_to :start_city, class_name: 'City'
	has_many :country_adventures
	has_many :countries, through: :country_adventures
end
