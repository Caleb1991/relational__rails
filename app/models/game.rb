class Game < ApplicationRecord
  belongs_to :developer

  def self.only_show_physical_releases
    all.where(physical_release: true)
  end
end
