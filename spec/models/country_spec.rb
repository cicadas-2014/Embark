require 'rails_helper'

describe Country do

  let(:country) { build(:country) }

  it "should be vaild" do
    expect(country).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:country, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a description" do
    expect(build(:country, description:nil)).to have(1).errors_on(:description)
  end

  it "cannot have a duplicate name" do
    create(:country, name: "Argentina")
    expect(build(:country, name: "Argentina")).to have(1).errors_on(:name)
  end
end