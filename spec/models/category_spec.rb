require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) {Category.create(name:'Fishing')}

  it "has a valid category" do
    expect(Category.new()).to be_valid
  end

  it "is invalid without a description" do 
    expect(category).to respond_to(:name)
  end
end
