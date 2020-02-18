class UsersController < ApplicationController

  def show
    @user = current_user
    @dates = Sighting.ordered_dates(current_user.id)
    # byebug
  end
  
end
