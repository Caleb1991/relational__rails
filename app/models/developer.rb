class Developer < ApplicationRecord
  has_many :games, :dependent => :destroy

  def game_count
    games.count
  end

  def self.order_by_created
    all.order(created_at: :desc)
  end
end
