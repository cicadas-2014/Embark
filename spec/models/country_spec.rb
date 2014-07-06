require 'rails_helper'

RSpec.describe Country, :type => :model do
  let(:country) {Country.create(name:'Norway',code:'NO')}
  
  it "should be valid" do
    expect(country).to be_valid
  end

  it "belongs to a country" do
    expect(country).to respond_to :name
  end

  it "belongs to an adventure" do
    expect(country).to respond_to :code
  end
  
end