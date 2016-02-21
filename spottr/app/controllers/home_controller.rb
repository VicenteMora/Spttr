class HomeController < ApplicationController
	before_action :authenticate_user!

	def home
		render 'home'
	end
end
