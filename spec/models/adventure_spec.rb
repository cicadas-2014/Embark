require 'spec_helper'

describe "Adventure" do
  before(:each) do
    Adventure.create( name: 'Jarkata',
                  	  scope: 'local')
  end

  describe "User can view 3 options in the form page"  do
    it "by visiting the homepage" do
      visit root_path
      expect(body).to have_field("Local")
      expect(body).to have_field("Continental")
      expect(body).to have_field("Global")
    end

    it "asks the user to choose an adventure" do
      visit root_path
      expect(page).to have_content("Choose an adventure")
    end
  end

  describe "User can click on an adventure that" do
    it "redirects to the adventures page" do
      visit stories_all_path 
      expect(response).to redirect_to '/adventures'
    end
  end

  describe "Page displays all adventures of a specific scope" do
    it "by clicking on a scope in the forms" do
      visit adventures_all_path
      expect(response.status).to eq 200
    end
  end
end