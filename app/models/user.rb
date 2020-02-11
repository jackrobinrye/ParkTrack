class User < ApplicationRecord
    has_many :sightings
    has_many :parks, through: :sightings
    has_many :species, through: :sightings
end
