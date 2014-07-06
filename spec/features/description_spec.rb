require 'rails_helper'

describe 'views/embark/description.html.erb' do	
	context 'description' do
		it "description " do
			visit description_path
			expect(page).to have_selector()
		end
		it "description " do
			visit description_path
			click_link("Local")
			expect(current_path).to eq description_path
		end
	end
end