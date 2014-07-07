class Adventure < ActiveRecord::Base
	has_many :adventure_categories
	has_many :categories, through: :adventure_categories
	has_many :adventure_cities
	has_many :cities, through: :adventure_cities
end
