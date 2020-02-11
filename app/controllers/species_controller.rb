class SpeciesController < ApplicationController
  def index
    @species = Species.all
  end

  def show
    @species = Species.find(params[:id])
    @parks = alphabetize(@species.parks.uniq)
  end
end
