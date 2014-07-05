require 'rails_helper'

describe 'User selects a start_city' do
  context 'have the option to select a start_city' do
    visit start_city_path

    fill_in 'Name', with: 'Jarkata'
    click_button 'Set Start_city'

    expect(page).to have_css '.start-city', 'Jarkata'
  end
end
