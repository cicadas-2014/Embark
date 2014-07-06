require 'rails_helper'
feature 'views/embark/description.html.erb' do	
	let(:adventure) { Adventure.create(id: 1, name: 'adventure', description: 'description', duration: 2, map_url: 'map.png', image_url: 'image.png', city: 'NYC') }
	scenario "the page should have the adventure's images" do
		visit "/adventures/1"
		expect(page).to have_css('img', text: 'adventure.image_url')
	end
end