require 'rails_helper'
    describe Country do 
      it "has a valid id" do
      end

<<<<<<< HEAD
      it "is invalid without a name" do
      end

      it "is invalid without a geolocation" do
      end

      it "returns a country's full name as a string" do
      end
      
    end
=======
RSpec.describe Country, :type => :model do
  
  # context "when Country is invalid" do

  #   it "with no Country" do
  #     expect(build(:country, score: nil)).to have(1).errors_on(:country)
  #   end

  #   it "with a country of over 200 million" do
  #     expect(build(:country, score: 'a'*200)).to be_valid
  #   end

  #   it "with an anecdote of over 201 characters" do
  #     expect(build(:story, anecdote: 'a'*201)).to have(1).errors_on(:anecdote)
  #   end
  # end

  # context "when anecdote is valid" do
  #   it "belongs to a color" do
  #     expect(build(:story)).to respond_to :color
  #   end

  # end

>>>>>>> d2c6e71a04ad1d6c33388309acea75d2778fc13f
end
