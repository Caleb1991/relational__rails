require 'rails_helper'
RSpec.describe 'Developers Associated Games' do
  before :each do
    @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
    @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
    @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
  end

  it 'shows games associated with the selected developer' do
    visit "/developers/#{@developer_1.id}/games"

    expect(page).to have_content(@game_1.name)
    expect(page).to have_content(@game_1.year_released)
    expect(page).to have_content(@game_1.consoles)
    expect(page).to have_content(@game_1.physical_release)
    expect(page).to have_content(@game_1.esrb_rating)
    expect(page).to_not have_content(@game_2.name)
  end

  it 'has a link to developers' do
    visit "/developers/#{@developer_1.id}/games"

    click_on 'Developers'

    expect(current_path).to eq('/developers')
  end

  it 'has a link to games index' do
    visit "/developers/#{@developer_1.id}/games"

    click_on 'Games'

    expect(current_path).to eq('/games')
  end

  it 'can create a game' do
    visit "/developers/#{@developer_1.id}/games"

    expect(page).to_not have_content('Fallout 4')
    expect(page).to_not have_content(2014)
    expect(page).to_not have_content('Xbox One')
    expect(page).to_not have_content(false)
    expect(page).to_not have_content('T')

    click_on 'Create Game'

    fill_in 'Name', with: 'Fallout 4'
    fill_in 'Year released', with: 2014
    fill_in 'Consoles', with: 'Xbox One'
    fill_in 'Physical release', with: false
    fill_in 'Esrb rating', with: 'T'

    click_on 'Create New Game'

    expect(current_path).to eq("/developers/#{@developer_1.id}/games")

    expect(page).to have_content('Fallout 4')
    expect(page).to have_content(2014)
    expect(page).to have_content('PS4')
    expect(page).to have_content(true)
    expect(page).to have_content('M')
  end

  xit 'has a link to sort alphabetically' do
    visit "/developers/#{@developer_1.id}/games"

    click_on 'Sort Alphabetically'
    binding.pry
    expect(current_path).to eq("/developers/#{@developer_1.id}/games?sort=true")
  end

  it 'has a link to edit games' do
    visit "/developers/#{@developer_1.id}/games"

    click_on "Edit #{@game_1.name}"

    expect(current_path).to eq("/games/#{@game_1.id}/edit")
  end

  it 'can delete games' do
    visit "/developers/#{@developer_1.id}/games"

    expect(page).to have_content('Skyrim')
    expect(page).to have_content(2010)
    expect(page).to have_content('PS4')
    expect(page).to have_content(true)
    expect(page).to have_content('M')

    click_on "Delete #{@game_1.name}"

    expect(current_path).to eq("/games")

    expect(page).to_not have_content('Skyrim')
  end
end
