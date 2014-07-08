class Category < ActiveRecord::Base
	has_many :adventure_categories
	has_many :adventures, through: :adventure_categories
end
