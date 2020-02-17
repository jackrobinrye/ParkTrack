class Species < ApplicationRecord
    has_many :sightings
    has_many :users, through: :sightings
    has_many :parks, through: :sightings

    validates :name, presence: true
    validates :kingdom, presence: true

    def self.these_kingdoms
        ['Animalia', 'Plantae', "Fungi"]
    end

    def self.this_kingdom(arr, kingdom_name)
        arr.map do |species|
            if species.kingdom == kingdom_name
                species
            end
        end.compact!
    end





    # def self.name=(name)
    # end
end
