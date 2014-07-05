require 'rails_helper'
RSpec.describe Category, :type => :model do
    describe Category do
 
      it "has a valid category" do
        expect(Category.new()).to be_valid
  	  end

      it "is invalid without a description" do 
        expect(category.description).to exist
      end

      it "is invalid without a country" do 
        expect(category.country).to exist
      end

      it "is invalid without an image" do
        expect(category.image).to exist
      end

      it "is invalid without a duration" do
        expect(category.duration).to exist
      end 

      it "returns a category's full name as a string" do 
        expect(category.name).to be_a(string)
      end
    end
  end
end
