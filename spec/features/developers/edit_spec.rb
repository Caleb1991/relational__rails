require 'rails_helper'

RSpec.describe 'Developers Edit page' do
  before :each do
    @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
    @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
    @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
  end

  it 'has an edit form' do
    visit "/developers/#{@developer_1.id}/edit"

    expect(page).to have_content('Name')
    expect(page).to have_content('Year founded')
    expect(page).to have_content('Still active')
    expect(page).to have_content('City')
    expect(page).to have_content('Number of staff')
  end

  it 'can edit a developer' do
    visit "/developers/#{@developer_1.id}"

    expect(page).to have_content('Bethesda')

    click_on("Update Developer")

    fill_in "Name", with: 'Konami'

    click_on 'Update Developer'

    expect(current_path).to eq("/developers/#{@developer_1.id}")
    expect(page).to have_content('Konami')
  end
end
