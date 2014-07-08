require 'csv'
def makeCountriesContinents
  CSV.foreach('db/csvFiles/countries.csv') do |country|
    country = country[0].split('|')
    Country.create(name: country[1], code: country[0])
  end
  CSV.foreach('db/csvFiles/country_continent.csv') do |countryRow|
    continent = Continent.find_or_create_by(name:countryRow[0])
    country = Country.find_or_create_by(name:countryRow[1])
    puts country.name
    country.continent = continent
  end
end