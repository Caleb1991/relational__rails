require 'rails_helper'

RSpec.describe 'Developers New Form' do
  before :each do
    @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
    @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
    @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
  end

  it 'has a form to create a new developer' do
    visit '/developers/new'

    expect(page).to have_content('Name')
    expect(page).to have_content('Year founded')
    expect(page).to have_content('Still active')
    expect(page).to have_content('City')
    expect(page).to have_content('Number of staff')
  end

  it 'can create a new developer' do
    visit '/developers'

    expect(page).to_not have_content('BioWare')

    click_on 'New Developer'

    fill_in 'Name', with: 'BioWare'
    fill_in 'Year founded', with: 1988
    fill_in 'Still active', with: true
    fill_in 'City', with: 'Arvada'
    fill_in 'Number of staff', with: 1033

    click_on 'Create Developer'

    expect(current_path).to eq('/developers')
    expect(page).to have_content('BioWare')
  end
end
