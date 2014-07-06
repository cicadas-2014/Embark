require 'rails_helper'

describe "adventure" do
	
  describe "User can view adventure" do
    it "by visiting homepage" do
      visit adventure_url
      expect(page).to have_css("#adventure-container")
    end
  end

  describe "User can see an adventure list" do
    it "by visiting the home page"  do
      visit adventure_url
      expect(page).to have_content("Pick an adventure")
      expect(page).to have_css('.adventure-list')
    end
  end

  describe "User can click on an adventure" do
    it "when viewing the adventures list" do
      visit adventure_url
      expect(page).to have_content(adventure.adventure)
    end
  end

  describe "User can read about adventure data" do
    it "by clicking on about link" do
      visit adventure_url
      click('About')
      expect(page).to have_content('About Embark')
    end
  end

end