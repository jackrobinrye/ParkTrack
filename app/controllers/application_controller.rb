class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :user_signed_in?

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
    
end
