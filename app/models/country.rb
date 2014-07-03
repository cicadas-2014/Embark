class Country < ActiveRecord::Base
  has_many :country_adventures
  has_many :adventures, through: :country_adventures
  
end
