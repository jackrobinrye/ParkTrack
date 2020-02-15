class SightingsController < ApplicationController

  before_action :require_login
  before_action :require_be_current_user
  skip_before_action :require_be_current_user, only: [:new, :create, :edit, :update]

  def show
    @sighting = Sighting.find(params[:id])
  end

  def index
    @sightings = Sighting.user_is_current(current_user.id)
    byebug
  end

  def new
    @parks = alphabetize(Park.all)
    @sighting = current_user.sightings.build
    @species = @sighting.build_species
    @park = @sighting.build_park
  end
  
  def create
    
    @sighting = Sighting.new(sighting_params)
    
    # byebug
    if @sighting.save
      redirect_to sighting_path(@sighting)
    else 
      flash.alert = "Oh no! Something went wrong. Please fill in all fields properly!"
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
    params.require(:sighting).permit(:date, :user_id, park_attributes: [:id, :name, :location, :size],  species_attributes: [:name, :kingdom])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def require_be_current_user
    return head(:forbidden) unless session[:user_id] == current_user.id
  end

end
