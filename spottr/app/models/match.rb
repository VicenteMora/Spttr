class Match < ActiveRecord::Base
	has_many :users, through: :match_association
	has_many :messages
end
