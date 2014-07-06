require 'rails_helper'

RSpec.describe Image, :type => :model do
	 let(:image) {Image.create(url:'something.com',longitude:5,latitude:5,adventure_id:5)}

  it "has a valid image" do
    expect(City.new()).to be_valid
  end

  it "has a valid background-image" do
    expect(image).to respond_to(:url)
  end

  it "have a longitude" do 
    expect(image).to respond_to(:longitude)
  end

  it "have a latitude" do
    expect(image).to respond_to(:latitude)
  end

  it "have a adventure id" do 
    expect(image).to respond_to(:adventure_id)
  end
end