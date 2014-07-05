require 'spec_helper'

describe "Image" do
  before(:each) do
    Image.find(id=1)
  end

  describe "User can view image"  do
    it "by visiting the homepage" do
      visit root_path
      expect(body).to return("Image")
    end

    it "Image" do
      visit root_path
      expect(page).to have_content("Choose an Image")
    end
  end
end
