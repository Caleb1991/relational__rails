require 'rails_helper'
RSpec.describe 'Game Index Page' do
  before :each do
    @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
    @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

    @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
    @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')

    visit "/games"
  end

  it "I see each Child in the system including the Child's attributes" do
    within("#game-#{@game_1.id}") do
      expect(page).to have_content(@game_1.name)
      expect(page).to have_content(@game_1.year_released)
      expect(page).to have_content(@game_1.consoles)
      expect(page).to have_content(@game_1.physical_release)
    end

    within("#game-#{@game_2.id}") do
      expect(page).to have_content(@game_2.name)
      expect(page).to have_content(@game_2.year_released)
      expect(page).to have_content(@game_2.consoles)
      expect(page).to have_content(@game_2.physical_release)
    end
  end
end
