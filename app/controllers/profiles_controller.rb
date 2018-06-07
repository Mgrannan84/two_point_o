class ProfilesController  < ApplicationController
    
    #GET to /users/:user_id/profile/new
    def new
        #Render blank profile detials form. 
        @profile = Profile.new
    end
end
