require 'rails_helper'

RSpec.describe 'Developer Games New Page' do
  before :each do
    @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
    @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
    @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
  end

  it 'has a form to create a new game' do
    visit "developers/#{@developer_1.id}/games/new"

    expect(page).to have_content('Name')
    expect(page).to have_content('Year released')
    expect(page).to have_content('Consoles')
    expect(page).to have_content('Physical release')
    expect(page).to have_content('Esrb rating')
  end
end
