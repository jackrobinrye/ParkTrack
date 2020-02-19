class Species < ApplicationRecord
    has_many :sightings
    has_many :users, through: :sightings
    has_many :parks, through: :sightings

    validates :name, presence: true
    validates :kingdom, presence: true

    def name=(name)
        super(name.titleize)
    end

    def self.kingdoms
        ['Animalia', 'Plantae', "Fungi"]
    end

    def self.this_kingdom(arr, kingdom_name)
        arr.select do |species|
            species.kingdom == kingdom_name
        end
    end







    # def self.name=(name)
    # end
end
