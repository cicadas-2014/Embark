require 'rails_helper'

RSpec.describe "adventure" do
  describe "User can view adventure" do
    it "by visiting homepage" do
      visit adventures_path
      expect(page).to have_css("#gallery")
    end
  end
end