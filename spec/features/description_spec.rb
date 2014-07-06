require 'rails_helper'

describe 'views/embark/description.html.erb' do	
	context 'description' do
		it "description " do
			visit home_path
			expect(page).to have_selector("a", text: "Local")
		end
		it "description " do
			visit home_path
			click_link("Local")
			expect(current_path).to eq adventures_path
		end
	end
end