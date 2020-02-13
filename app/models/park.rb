class Park < ApplicationRecord
    has_many :sightings
    has_many :users, through: :sightings
    has_many :species, through: :sightings

    validates :name, presence: true
    validates :size, presence: true
    validates :location, presence: true

end
