class Sighting < ApplicationRecord
    belongs_to :user
    belongs_to :species
    belongs_to :park

    validates :species, presence: true
    validates :park, presence: true 
    # v maybe take out later v
    # validates :date, :on_or_before => lambda { Date.current }
end
