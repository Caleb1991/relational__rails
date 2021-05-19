require 'rails_helper'

RSpec.describe 'Developer show page' do

before :each do
  @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
  @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

  @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
  @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
end

  it 'shows a single parent and their attributes' do
    visit "/developers/#{@developer_1.id}"

    expect(page).to have_content(@developer_1.name)
    expect(page).to have_content(@developer_1.year_founded)
    expect(page).to have_content(@developer_1.still_active)
    expect(page).to have_content(@developer_1.city)
    expect(page).to have_content(@developer_1.number_of_staff)
    expect(page).to_not have_content(@developer_2.name)
  end

  it 'shows the number of associated games' do
    visit "/developers/#{@developer_1.id}"

    expect(page).to have_content(@developer_1.games.count)
  end

  it 'has a link to the developers games' do
    visit "/developers/#{@developer_1.id}"

    expect(page).to_not have_content(@game_1.name)

    click_on 'Games By Developer'

    expect(current_path).to eq("/developers/#{@developer_1.id}/games")
    expect(page).to have_content(@game_1.name)
  end

  it 'has a link to update the developer' do
    visit "/developers/#{@developer_1.id}"

    click_on('Update Developer')

    expect(current_path).to eq("/developers/#{@developer_1.id}/edit")
  end

  xit 'can delete the developer' do
    visit '/developers'

    expect(page).to have_content(@developer_1.name)

    visit "/developers/#{@developer_1.id}"

    click_on "Delete #{@developer_1.name}"

    expect(current_path).to eq('/developers')
    expect(page).to_not have_content(@developer_1.name)
  end
end
