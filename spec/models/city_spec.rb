require 'rails_helper'


RSpec.describe City, :type => :model do
describe 'city' do
  context 'the country has a city' do
    visit start_city_path

    fill_in 'Name', with: 'Jarkata'
    click_button 'Set Start_city'

    expect(page).to have_css '.start-city', 'Jarkata'
  end
end
