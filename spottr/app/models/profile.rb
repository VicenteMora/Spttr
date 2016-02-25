class Profile < ActiveRecord::Base
	validates :first_name, :last_name, :gym, :availability, :fitness_level, :gender, :over_18, presence: true 
	belongs_to :user
	def name
		return self.first_name + " " + self.last_name
	end
end
