class MatchesController < ApplicationController

	def index
		gym = current_user.profile.gym 
		availability = current_user.profile.availability
		fitness_level = current_user.profile.fitness_level
		over_18 = current_user.profile.over_18
		@match = Profile.where(gym: gym).where(availability: availability).where(fitness_level: fitness_level).where(over_18: over_18).where.not(user_id: current_user.id)
		    
    end

#----------Check with Kayserr what exactly goes here-------
	def match
		# @match.take(5)
	end

	def create_matches 
		# @user = current_user
		# @match = Match.create(params[:match])
		# @user.match = @match 
	end

	def reject

	end



end
