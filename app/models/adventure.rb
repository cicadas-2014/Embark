class Adventure < ActiveRecord::Base
  has_many :country_adventures
  has_many :countries, through: :country_adventures
  has_many :images

end
