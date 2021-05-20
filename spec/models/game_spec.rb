require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relationships' do
    it { should belong_to(:developer)}
  end

  describe 'initialize' do
    it 'exists' do
      @developer_1 = Developer.create!(name: 'Bethesda', year_founded: 1969, still_active: true, city: 'Bethesda', number_of_staff: 420)
      @game_1 = @developer_1.games.create!(name: 'Skyrim', year_released: 2010, consoles: 'PS4', physical_release: true, esrb_rating: 'M')

      expect(@game_1).to be_an_instance_of(Game)
    end
  end
end
