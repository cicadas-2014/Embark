require 'csv'
def top20
  adventures = []
  CSV.foreach('db/adventures.csv') do |row|
    adventures << row
  end

  slice = adventures.each_slice(5)
  slice.each do |s|
  	p s[4][0]
    # adventure = Adventure.create(name: s[0][0], duration: s[2][0].to_i, description: s[3][0], image_url: s[4][0])
    # p adventure
    # p s[1][0]
    # country = Country.find_or_create_by(name:s[1][0])
    # p country
    # CountryAdventure.create(country_id: country.id, adventure_id: adventure.id)
  end
end

def restore_db_from_csv
	puts "importing adventures from a csv file"
	CSV.foreach("db/dbfiles/adventure.csv") do |csv|
		Adventure.create(id:csv[0],name:csv[1],description:csv[2],duration:csv[3],map_url:csv[4],image_url:csv[5],city_id:csv[6],created_at:csv[7],updated_at:csv[8])
	end

	puts "importing countries from a csv file"
	CSV.foreach("db/dbfiles/country.csv") do |csv|
		Country.create(id:csv[0],name:csv[1],code:csv[2],created_at:csv[3],updated_at:csv[4])
	end

	puts "importing category from a csv file"
	CSV.foreach("db/dbfiles/category.csv") do |csv|
		Category.create(id:csv[0],name:csv[1],created_at:csv[2],updated_at:csv[3])
	end

	puts "importing image from a csv file"
	CSV.foreach("db/dbfiles/image.csv") do |csv|
		Image.create(id:csv[0],url:csv[1],longitude:csv[2],latitude:csv[3],adventure_id:csv[4],created_at:csv[5],updated_at:csv[6])
	end

	puts "importing city from a csv file"
	CSV.foreach("db/dbfiles/city.csv") do |csv|
		City.create(id:csv[0],name:csv[1],longitude:csv[2],latitude:csv[3],country_id:csv[4],created_at:csv[5],updated_at:csv[6])
	end

	puts "importing category_adventure from a csv file"
	CSV.foreach("db/dbfiles/category_adventure.csv") do |csv|
		CategoryAdventure.create(id:csv[0],category_id:csv[1],adventure_id:csv[2],created_at:csv[3],updated_at:csv[4])
	end

	puts "importing country_adventure from a csv file"
	CSV.foreach("db/dbfiles/country_adventure.csv") do |csv|
		CountryAdventure.create(id:csv[0],country_id:csv[1],adventure_id:csv[2],created_at:csv[3],updated_at:csv[4])			
	end
end
