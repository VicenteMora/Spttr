class MatchesController < ApplicationController

	def index
		possible_profiles = []
		Profile.all.each do |profile|
			if profile.user != current_user && !current_user.matchedUsers.include?(User.find_by(id: profile.user.id))
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

	def create
		if !current_user.matchedUsers.include?(User.find_by(id: params[:matched_user_id]))
		newMatch = Match.create(:isRejected => false)
		newMatchAssociationA = MatchAssociation.create(:user_id => current_user.id, :match_id => newMatch.id)
		newMatchAssociationB = MatchAssociation.create(:user_id => params[:matched_user_id], :match_id => newMatch.id)
		redirect_to("/dashboard")
	else
		redirect_to(messages_path(current_user.matches.select{|match| match.users.include?(User.find_by(id: params[:matched_user_id]))}))
	end
	end

	def reject

	end



end
