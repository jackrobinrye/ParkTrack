class Sighting < ApplicationRecord
    belongs_to :user
    belongs_to :species
    belongs_to :park

    validates :species_id, presence: true
    validates :park_id, presence: true 

    def species_attributes=(species)
        # byebug
        self.species = Species.find_or_create_by(species)
    end

    def park_attributes=(park)
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
