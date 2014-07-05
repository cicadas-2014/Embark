require 'rails_helper'

RSpec.describe Country, :type => :model do
  
  context "when Countryt is invalid" do
    it "with no Country" do
      expect(build(:country, score: nil)).to have(1).errors_on(:country)
    end

    it "with a country of over 200 million" do
      expect(build(:country, score: 'a'*200)).to be_valid
    end

    it "with an anecdote of over 201 characters" do
      expect(build(:story, anecdote: 'a'*201)).to have(1).errors_on(:anecdote)
    end
  end

  context "when anecdote is valid" do
    it "belongs to a color" do
      expect(build(:story)).to respond_to :color
    end
  end

end
