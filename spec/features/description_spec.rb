require 'rails_helper'

feature 'Home page' do

	scenario 'visit page' do
		description = create(:description)
		visit home_path
		expect(page).to have_content('Adventure Description')
		expect(page).to have_content(description.content)
		expect(page).to have_content(desctiption.name)
		expect(page).to have_content(desctiption.title)
	end
end