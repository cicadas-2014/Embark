require 'rails_helper'

RSpec.describe Image, :type => :model do
	 let(:image) {Image.create(panoramio_id: 12345678,original_image_url: 'www.www.www',medium_image_url: 'www.www.www',small_image_url: 'www.www.www',longitude: 12.34343,latitude: 12.34343, city_id:5)}

  it "has a valid image" do
    expect(Image.new()).to be_valid
  end

  it "has a valid panormio id" do
    expect(image).to respond_to(:panoramio_id)
  end  
  it "has a valid original-image" do
    expect(image).to respond_to(:original_image_url)
  end
  it "has a valid medium-image" do
    expect(image).to respond_to(:medium_image_url)
  end
  it "has a valid small-image" do
    expect(image).to respond_to(:small_image_url)
  end
  it "have a longitude" do 
    expect(image).to respond_to(:longitude)
  end

  it "have a latitude" do
    expect(image).to respond_to(:latitude)
  end

  it "have a adventure id" do 
    expect(image).to respond_to(:city_id)
  end
end


