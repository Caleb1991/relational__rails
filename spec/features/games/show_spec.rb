require 'rails_helper'
RSpec.describe 'Game Show Page' do
  before :each do
    @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
    @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
    @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
  end

  it 'shows one child and its attributes' do
    visit "/games/#{@game_1.id}"

    expect(page).to have_content(@game_1.name)
    expect(page).to have_content(@game_1.year_released)
    expect(page).to have_content(@game_1.consoles)
    expect(page).to have_content(@game_1.physical_release)
    expect(page).to have_content(@game_1.esrb_rating)
    expect(page).to_not have_content(@game_2.name)
  end

  it 'has a link back to developers index' do
    visit "/games/#{@game_1.id}"

    click_on 'Developers'

    expect(current_path).to eq('/developers')
  end

  it 'has a link to games index' do
    visit "/games/#{@game_1.id}"

    click_on 'Games'

    expect(current_path).to eq('/games')
  end

  it 'has a link to update games' do
    visit "/games/#{@game_1.id}"

    click_on "Update #{@game_1.name}"

    expect(current_path).to eq("/games/#{@game_1.id}/edit")
  end

  it 'has can delete games' do
    visit "/games"

    expect(page).to have_content(@game_1.name)

    visit "/games/#{@game_1.id}"

    click_on "Delete #{@game_1.name}"

    expect(current_path).to eq('/games')

    expect(page).to_not have_content(@game_1.name)
  end
end
