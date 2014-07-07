require 'rails_helper'

describe 'views/embark/home.html.erb' do	
	context 'buttons' do
		it "have local button'" do
			visit home_path
			expect(page).to have_selector("a", text: "Local")
		end
		it "have continental button'" do
			visit home_path
			expect(page).to have_selector("a", text: "Continential")
		end
		it "have global button'" do
			visit home_path
			expect(page).to have_selector("a", text: "Global")
		end
		it "local button redirects to right page" do
			visit home_path
			click_link("Local")
			expect(current_path).to eq adventures_path
		end
		it "local button redirects to right page" do
			visit home_path
			click_link("Continental")
			expect(current_path).to eq adventures_path
		end
		it "local button redirects to right page" do
			visit home_path
			click_link("Global")
			expect(current_path).to eq adventures_path
		end
	end
end