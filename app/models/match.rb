class Match < ActiveRecord::Base
	has_many :match_associations
	has_many :users, through: :match_associations
	has_many :messages

	def otherUser(current_user_id)
		if self.users[0].id != current_user_id
			return self.users[0]
		else
			 return self.users[1]
		end

	end
end
