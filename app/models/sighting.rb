class Sighting < ApplicationRecord
    belongs_to :user
    belongs_to :species
    belongs_to :park
end
