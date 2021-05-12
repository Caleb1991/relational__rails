class Developer < ApplicationRecord
  has_many :games, dependent: :destroy
end
