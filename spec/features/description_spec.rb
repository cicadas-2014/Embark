require 'rails_helper'
RSpec.describe "adventure" do
	feature 'views/embark/description.html.erb' do	
		let!(:adventure) { Adventure.create(id: 31, name: 'adventure', description: 'description', duration: 2, map_url: 'map.png', image_url: 'image.png') }
		scenario "the page should have the adventure's image" do
			visit '/adventures/31'
		expect(page).to have_css('.show_images')
	end
end
	feature 'views/embark/description.html.erb' do	
		let!(:adventure) { Adventure.create(id: 31, name: 'adventure', description: 'description', duration: 2, map_url: 'map.png', image_url: 'image.png') }
		scenario "the page should have the adventure's image" do
			visit '/adventures/31'
		expect(page).to have_css('#description')
	end
	end	
	feature 'views/embark/description.html.erb' do	
		let!(:adventure) { Adventure.create(id: 31, name: 'adventure', description: 'description', duration: 2, map_url: 'map.png', image_url: 'image.png') }
		scenario "the page should have the adventure's image" do
			visit '/adventures/31'
		expect(page).to have_css('#adventure_map')
	end	
end
end