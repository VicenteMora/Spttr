class HomeController < ApplicationController
	before_action :authenticate_user!,except: :home

	def home
		render 'home'
	end

	def dashboard
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
		render'dashboard'
	end
end
