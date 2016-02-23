class MatchesController < ApplicationController

	def index
		gym = current_user.profile.gym 
		availability = current_user.profile.availability
		fitness_level = current_user.profile.fitness_level
		over_18 = current_user.profile.over_18
		@match = Profile.where(gym: gym).where(availability: availability).where(fitness_level: fitness_level).where(over_18: over_18)
    	@match.delete(current_user)
    end


	def generate_match
		
	end

	def create_matches 

	end

	def reject

	end



end
