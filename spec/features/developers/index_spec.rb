require 'rails_helper'
RSpec.describe 'Developer Index Page' do
  before :each do
    @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
    @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
    @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')

    visit "/developers"
  end
  it "I see the name of each parent record in the system" do
    expect(page).to have_content(@developer_1.name)
    expect(page).to have_content(@developer_1.still_active)
    expect(page).to have_content(@developer_1.city)
    expect(page).to have_content(@developer_1.number_of_staff)
  end
end
