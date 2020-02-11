class ParksController < ApplicationController
  def index
    @parks = Park.all
  end
  
  def show
    @park = Park.find(params[:id])
    @species = alphabetize(@park.species.uniq)
  end
end
