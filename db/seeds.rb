require 'csv'


@adventures = []
CSV.foreach('db/adventures.csv') do |row|
  @adventures << row
end

@sliced = @adventures.each_slice(5)
@sliced.each do |s|
  @adventure = Adventure.create(name: s[0][0], duration: s[2][0].to_i, description: s[3][0])
  @country = Country.create(name: s[1][0])
  CountryAdventure.create(country_id: @country.id, adventure_id: @adventure.id)
  Image.create(url: s[4][0], adventure_id: @adventure.id)
end