class AdventureCities < ActiveRecord::Base
	belongs_to :adventure
	belongs_to :city
end
