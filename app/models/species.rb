class Species < ApplicationRecord
    has_many :sightings
    has_many :users, through: :sightings
    has_many :parks, through: :sightings

    validates :name, presence: true
    validates :kingdom, presence: true
end
