class Developer < ApplicationRecord
  has_many :games, dependent: :destroy

  def game_count
    games.count
  end
end
