class ApplicationController < ActionController::Base
    
    def alphabetize(arr)
        arr.sort { |a,b| a.name <=> b.name}
    end 

    def hello
        @parks = alphabetize(Park.all)
        @species = alphabetize(Species.all) 
    end 
    
end
