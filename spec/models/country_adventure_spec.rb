require 'rails_helper'

describe CountryAdventure do

  let(:country_adventure) { build(:country_adventure) }

  it "should be valid" do
    expect(country_adventure).to be_valid
  end

  it "belongs to a country" do
    expect(country_adventure).to respond_to :country
  end

  it "belongs to an adventure" do
    expect(country_adventure).to respond_to :adventure
  end
  
end