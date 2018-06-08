class ProfilesController  < ApplicationController
    
    #GET to /users/:user_id/profile/new
    def new
        #Render blank profile detials form. 
        @profile = Profile.new
    end
    
    # POST to /users/:user_id/profile
def create
  # Ensure that user is identified.
  @user = User.find( params[:user_id] )
  # Create profile for identified user. 
  @profile = @user.build_profile( profile_params )
  if @profile.save
    flash[:success] = "Profile updated!"
    redirect_to user_path( params[:user_id] )
  else
    render action: :new
  end
end

#for get request made to /user/:user_id/profile/edit
def edit
  @user = User.find( params[:user_id] )
  @profile = @user.profile
end


#Patch to /users/:user_id/profile
def update
  #Mass assign edited profile attributes and save (update)
  @user = User.find( params[:user_id] )
  @profile = @user.profile
  if @profile.update_attributes(profile_params)
  flash[:success] = "Profile updated!"
  #redirect user to their profile.
  redirect_to user_path(id: params[:user_id] )
  else
  render action: :edit
  end
end


private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
  end
end

