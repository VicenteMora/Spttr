class ProfilesController < ApplicationController
		before_action :authenticate_user!

	def new
		@profile = Profile.new
	end

	def show
		@profile = Profile.find_by(id: params[:id])
	end

	def edit
    @user=User.find_by(id: current_user.id)
		@profile = @user.profile
    # Profile.find_by(id: params[:id])
	end

	def update
		@profile = Profile.find_by(id: params[:id])
		@profile.update_attributes(profile_params)
		redirect_to profile_path(@profile)
	end


	def create
		@user = current_user
    	@profile = Profile.create(profile_params)
    	@user.profile = @profile
    unless @user.profile
      render 'new'
    else
     redirect_to profile_path(@profile)
    end
  end

  	def destroy
  		@profile = Profile.find_by(id: params[:id])
  		if @profile
  		@profile.destroy
  		redirect_to '/'
  	    else 
  		redirect_to '404'
  		end
  	end
  	private
	
	def profile_params
  	params.require(:profile).permit(:first_name, :last_name, :availability, :gym, :gender, :fitness_level, :over_18, :headshot_url)
  	end	
end
