class Category < ActiveRecord::Base
	has_many :category_adventures
	has_many :adventures, through: :category_adventures
end
