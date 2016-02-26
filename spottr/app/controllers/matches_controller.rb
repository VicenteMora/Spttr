class MatchesController < ApplicationController

	def index
		gym = current_user.profile.gym 
		availability = current_user.profile.availability
		fitness_level = current_user.profile.fitness_level
		over_18 = current_user.profile.over_18
		
		possible_profiles = []

		Profile.all.each do |profile|
			if profile.user != current_user
				
			
			 
				p "Creating matches"
				points = 0
				if profile.availability == current_user.profile.availability
					points += 1
				end
				if profile.gym == current_user.profile.gym
					points += 1
				end
				if profile.fitness_level == current_user.profile.fitness_level
					points += 1
				end
				if profile.over_18 == current_user.profile.over_18
					points += 1
				end
				if points == 4

					possible_profiles.append(profile)
				end
			end
		end
		
		
			
		
		@profiles = possible_profiles	    
    end

#----------Check with Kayserr what exactly goes here-------
	def match
		# @match.take(5)
	end

	def create_matches 
		newMatch = Match.new(:isRejected => false)
			if newMatch.save
				newMatchAssociationA = MatchAssociation.create(:user_id => current_user.id, :match_id => newMatch.id)
				newMatchAssociationB = MatchAssociation.create(:user_id => params[:matched_user_id], :match_id => newMatch.id)
			end
	end

	def reject

	end



end
