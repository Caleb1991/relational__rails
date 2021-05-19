require 'rails_helper'

RSpec.describe 'Games Edit Page' do
  before :each do
    @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Arvada', number_of_staff: 420)
    @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
    @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
  end

  it 'has an edit form' do
    visit "/games/#{@game_1.id}/edit"

    expect(page).to have_content('Name')
    expect(page).to have_content('Year released')
    expect(page).to have_content('Consoles')
    expect(page).to have_content('Physical release')
    expect(page).to have_content('Esrb rating')
  end

  it 'can edit a game' do
    visit "/games/#{@game_1.id}"

    expect(page).to have_content('Skyrim')
    expect(page).to have_content(2010)
    expect(page).to have_content('PS4')
    expect(page).to have_content(true)
    expect(page).to have_content('M')

    click_on("Update #{@game_1.name}")

    fill_in 'Name', with: 'Metal Gear Solid'
    fill_in 'Year released', with: 1991
    fill_in 'Consoles', with: 'PlayStation'
    fill_in 'Physical release', with: true
    fill_in 'Esrb rating', with: 'M'

    click_on 'Update Game'

    expect(current_path).to eq("/games/#{@game_1.id}")

    expect(page).to have_content('Metal Gear Solid')
    expect(page).to have_content(1991)
    expect(page).to have_content('PlayStation')
    expect(page).to have_content(true)
    expect(page).to have_content('M')
    expect(page).to_not have_content('Skyrim')
  end
end
