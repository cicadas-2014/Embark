require 'rails_helper'

RSpec.describe CategoryAdventure, :type => :model do

  let(:category_adventure) { build(:category_adventure) }

  it "should be valid" do
    expect(category_adventure).to be_valid
  end

  it "belongs to a category" do
    expect(category_adventure).to respond_to :category
  end

  it "belongs to an adventure" do
    expect(category_adventure).to respond_to :adventure
  end
  
end