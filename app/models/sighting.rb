class Sighting < ApplicationRecord
    belongs_to :user
    belongs_to :species
    belongs_to :park


    validates :species_id, presence: true
    validates :park_id, presence: true 
    validates :date, presence: true
    validates :date, uniqueness: { scope: [:species_id, :park_id], message: ->(object, data) { "You already made this entry!" }}


    def self.user_is(id)
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
        if !park[:id].empty?
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
    
    def self.ordered_dates(id)
        dates = []
        self.where(user_id: id).order(:date).map do |sighting|
            dates << sighting.date
        end
        dates.uniq
    end 
    
    def self.by_date(date)
        self.where(date: date).order(:name)
    end
    

end
