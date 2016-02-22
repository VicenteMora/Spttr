class HomeController < ApplicationController
	before_action :authenticate_user!,except: :home

	def home
		render 'home'
	end
end
