class SightingsController < ApplicationController

  before_action :require_login

  def show 
    require_be_current_user
    @sighting = Sighting.find(params[:id])
  end

  def index
    if pid = params[:park_id]
      @dates = Sighting.where(park_id: pid).ordered_dates(current_user.id)
    else 
      @dates = Sighting.ordered_dates(current_user.id)
    end
  end

  def new
    @parks = alphabetize(Park.all)
    @sighting = current_user.sightings.build
    @sighting.species = @sighting.build_species
    @sighting.park = @sighting.build_park unless @park_id = params[:park_id]
  end
  
  def create
    # byebug
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      redirect_to sighting_path(@sighting)
    else 
      @parks = alphabetize(Park.all)
      @sighting.species ||= @sighting.build_species
      @sighting.park ||= @sighting.build_park unless @park_id = params[:park_id]
      render :new
    end 
  end 
  
  def edit
    @parks = alphabetize(Park.all)
    @sighting = Sighting.find(params[:id])
    @sighting.species = @sighting.build_species unless @sighting.species
    @sighting.park = @sighting.build_park unless @park_id = params[:park_id]
  end

  def update
  end 

  def destroy
  end 
  
  private
  
  def sighting_params
    params.require(:sighting).permit(:date, :user_id, :park_id, park_attributes: [:id, :name, :location, :size],  species_attributes: [:name, :kingdom])
  end

  def require_login
    return head(:forbidden) unless session.include? :session_id
  end

  def require_be_current_user
    unless current_sighting_user_id == current_user.id
      flash.alert = "Sorry! You can't look at this sighting. It belongs to another user."
      redirect_to root_url 
    end
  end

  def current_sighting_user_id
    Sighting.find(params[:id]).user_id
  end

  

end
