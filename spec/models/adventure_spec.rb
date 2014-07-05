require 'rails_helper'

RSpec.describe Adventure, type: :model do
  let(:adventure) {Adventure.create(name: 'Awesome adventure', description: 'This is a awesome adventure with a loong description', duration:12,city_id:1)}

  # describe "User can view 3 options in the form page"  do
  #   it "by visiting the homepage" do
  #     visit root_path
  #     expect(index).to have_style(".")
  #   end

  #   it "asks the user to choose an adventure" do
  #     visit root_path
  #     expect(page).to have_content("Choose an adventure")
  #   end
  # end

  # describe "User can click on an adventure that" do
  #   it "redirects to the show page" do
  #     visit stories_all_path 
  #     expect(response).to redirect_to '/adventures'
  #   end
  # end

  # describe "User can view all adventures of a specific scope" do
  #   it "by clicking on a scope in the forms" do
  #     visit adventures_all_path
  #     expect(response.status).to eq 200
  #   end
  # end

  # it "had a method to add a user" do 
  #   visit root_path
  #   expect(respons).to equal('root_path')
  # end
end