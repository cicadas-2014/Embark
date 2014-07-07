require 'rails_helper'

RSpec.describe CategoryAdventure, :type => :model do

  let(:category_adventure) { CategoryAdventure.create(category_id:2, adventure_id:2) }

  it "should be valid" do
    expect(category_adventure).to be_valid
  end

  it "belongs to a category" do
    expect(category_adventure).to respond_to :category_id
  end

  it "belongs to an adventure" do
    expect(category_adventure).to respond_to :adventure_id
  end
  
end