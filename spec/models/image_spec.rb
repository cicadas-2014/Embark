<<<<<<< HEAD
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
=======
require 'rails_helper'

RSpec.describe Image, :type => :model do


end

>>>>>>> d2c6e71a04ad1d6c33388309acea75d2778fc13f

    it "Image" do
      visit root_path
      expect(page).to have_content("Choose an Image")
    end
  end
end
