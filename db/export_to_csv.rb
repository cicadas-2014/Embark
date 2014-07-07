require 'csv'
def export_to_csv
  puts "exporting adventures to a csv file"
  CSV.open("db/dbfiles/adventure.csv", "wb") do |csv|
    Adventure.all.each do |adventure|
      csv << adventure.attributes.values
    end
  end
  
  puts "exporting countries to a csv file"
  CSV.open("db/dbfiles/country.csv", "wb") do |csv|
    Country.all.each do |country|
      csv << country.attributes.values
    end
  end
  
  puts "exporting category to a csv file"
  CSV.open("db/dbfiles/category.csv", "wb") do |csv|
    Category.all.each do |category|
      csv << category.attributes.values
    end
  end
  
  puts "exporting image to a csv file"
  CSV.open("db/dbfiles/image.csv", "wb") do |csv|
    Image.all.each do |image|
      csv << image.attributes.values
    end
  end
  
  puts "exporting city to a csv file"
  CSV.open("db/dbfiles/city.csv", "wb") do |csv|
    City.all.each do |city|
      csv << city.attributes.values
    end
  end
  
  puts "exporting category_adventure to a csv file"
  CSV.open("db/dbfiles/category_adventure.csv", "wb") do |csv|
    CategoryAdventure.all.each do |category_adventure|
      csv << category_adventure.attributes.values
    end
  end
  
  puts "exporting country_adventure to a csv file"
  CSV.open("db/dbfiles/country_adventure.csv", "wb") do |csv|
    CountryAdventure.all.each do |country_adventure|
      csv << country_adventure.attributes.values
    end
  end
end