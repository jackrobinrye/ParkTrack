class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :user_signed_in?
    helper_method :kingdoms
    helper_method :kingdom
    helper_method :sighting_by_date


    def alphabetize(arr)
        arr.sort { |a,b| a.name <=> b.name}
    end 

    def hello
        @parks = alphabetize(Park.all)
        @species = alphabetize(Species.all) 
    end 




    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def sighting_by_date(date)
      Sighting.by_date(date).where(user_id: current_user.id)
    end


    
end
