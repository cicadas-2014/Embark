require 'rails_helper'
RSpec.describe CountryAdventure, :type => :model do
  let(:country_adventure) {CountryAdventure.create(country_id:5,adventure_id:5)}
  
  it "should be valid" do
    expect(country_adventure).to be_valid
  end

  it "belongs to a country" do
    expect(country_adventure).to respond_to :country_id
  end

  it "belongs to an adventure" do
    expect(country_adventure).to respond_to :adventure_id
  end
  
end