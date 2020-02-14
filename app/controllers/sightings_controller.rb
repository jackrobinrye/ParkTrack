class SightingsController < ApplicationController

  def show
    @sighting = Sightning.find(params[:id])
  end

  def new
    @sighting = current_user.sightings.build
    @species = @sighting.build_species
    @park = @sighting.build_park
  end

  def create
    
    byebug
    sighting = Sighting.new(sighting_params)
    if sighting.save
      redirect_to sighting_path(sighting)
    else 
      flash.alert = "Oh no! Something went wrong. Please fill in all fields!"
      render :new
    end 
  end 

  def edit
  end


  private

  # t.date "date"
  # t.integer "park_id"
  # t.integer "species_id"
  # t.integer "user_id"

  def sighting_params
    params.require(:sighting).permit(:date, :species, :parks, :user_id)
  end



end
