class Sighting < ApplicationRecord
    belongs_to :user
    belongs_to :species
    belongs_to :park

    validates :species_id, presence: true
    validates :park_id, presence: true 
    validates :date, presence: true


    def self.user_is_current(id)
        Sighting.where(user_id: id)
    end 

    def species_attributes=(species)
        if this_species = Species.find_by(name: species[:name])
            self.species = this_species
        else 
            self.species = Species.create(species)
        end
    end

    def park_attributes=(park)
        # byebug
        if park[:id]
            self.park = Park.find(park[:id])
        elsif park[:name]
            park[:name] = park[:name].titlecase
            if this_park = Park.find_by(name: park[:name])
                self.park = this_park
            else 
                self.park = Park.create(park)
            end 
        else 

        end 
    end

end
