class Developer < ApplicationRecord
  has_many :games, dependent: :destroy

  def game_count
    games.count
  end

  def self.order_by_created
    all.order(created_at: :desc)
  end

  def released_after(user_number)
    integer = user_number.to_i

    games.where('year_released > ?', integer)
  end

  def order_by_name
    games.order(:name)
  end
end
