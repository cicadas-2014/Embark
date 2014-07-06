class CategoryAdventure < ActiveRecord::Base
	belongs_to :category
	belongs_to :adventure
end
