class GameSession < ApplicationRecord
  has_many :cells
  has_many :terrains
end
