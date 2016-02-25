class MatchesController < ApplicationController

	def index
		gym = current_user.profile.gym 
		availability = current_user.profile.availability
		fitness_level = current_user.profile.fitness_level
		over_18 = current_user.profile.over_18
		profiles = Profile.all
		matches = []

		profiles.each do |profile|
			p "Deciding is match "
			p "PROFILE MATCHES", profile.user.matches
			if !profile.user.matches[0] || !profile.user.matches.select {|match| match.users.include?(current_user)} 
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
				if points > 2
					matches.append(profile)
				end
			end
		end
		matches.each do |match|
			newMatch = Match.new(:isRejected => false)
			if newMatch.save
				newMatchAssociationA = MatchAssociation.create(:user_id => current_user.id, :match_id => newMatch.id)
				newMatchAssociationB = MatchAssociation.create(:user_id => match.user.id, :match_id => newMatch.id)
			end
		end
		@match = Match.all.select {|match| match.match_associations[0].user = current_user || match.match_associations[1].user = current_user }		    
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
