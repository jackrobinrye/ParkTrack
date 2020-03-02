class UsersController < ApplicationController

  def show
    @user = current_user
    @dates = Sighting.ordered_dates(current_user.id)
  end

  def index
    # byebug
    @species = Species.find(params[:species_id])
    @users = alphabetize(@species.users)
  end 

  
end
