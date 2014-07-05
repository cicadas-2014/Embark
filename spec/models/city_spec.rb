require 'rails_helper'

<<<<<<< HEAD
describe 'city' do
  context 'the country has a city' do
    visit start_city_path

    fill_in 'Name', with: 'Jarkata'
    click_button 'Set Start_city'

    expect(page).to have_css '.start-city', 'Jarkata'
  end
=======
RSpec.describe City, :type => :model do


>>>>>>> d2c6e71a04ad1d6c33388309acea75d2778fc13f
end
