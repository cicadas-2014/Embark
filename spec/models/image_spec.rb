require 'rails_helper'

describe Image do
  it "has a valid background-image" do
    expect(build(:image)).to be_valid
  end

  it "is invalid without content" do
    expect(build(:image, content: nil)).to have(1).errors_on(:content)
  end
end