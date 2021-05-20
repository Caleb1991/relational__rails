require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'relationships' do
    it { should have_many(:games)}
  end

  describe 'initialize' do
    it 'exists' do
      @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)

      expect(@developer_1).to be_an_instance_of(Developer)
    end
  end
  
  describe 'game_count' do
    it 'counts the number of associated games' do
      @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
      @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

      @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
      @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')

      expect(@developer_1.game_count).to eq(1)
    end
  end

  describe '#order_by_created' do
    it 'orders developers byh most recently created' do
      @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
      @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

      expect(Developer.order_by_created).to eq([@developer_2, @developer_1])
    end
  end

  describe '#released_after' do
    it 'only shows games that were released after the given date' do
      @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
      @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

      @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
      @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
      @game_3 = @developer_1.games.create!(name: 'Oblivion', year_released: 1990, consoles: 'PS3', physical_release: true, esrb_rating: 'M')

      expect(@developer_1.games).to eq([@game_1, @game_3])
      expect(@developer_1.released_after('1991')).to eq([@game_1])
    end
  end

  describe '#order_by_name' do
    it 'orders developer games by name' do
      @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
      @developer_2 = Developer.create!(name: 'Capcom', year_founded: 1972, still_active: true, city: 'Denver', number_of_staff: 1600)

      @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
      @game_2 = @developer_2.games.create!(name: 'Resident Evil', year_released: 2015, consoles: 'PS4', physical_release: true, esrb_rating: 'M')
      @game_3 = @developer_1.games.create!(name: 'Oblivion', year_released: 1990, consoles: 'PS3', physical_release: true, esrb_rating: 'M')

      expect(@developer_1.games).to eq([@game_1, @game_3])
      expect(@developer_1.order_by_name).to eq([@game_3, @game_1])
    end
  end
end
