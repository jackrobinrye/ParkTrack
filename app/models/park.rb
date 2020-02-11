class Park < ApplicationRecord
    has_many :sightings
    has_many :users, through: :sightings
    has_many :species, through: :sightings
end
