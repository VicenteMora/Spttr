class Match < ActiveRecord::Base
	has_many :match_associations
	has_many :users, through: :match_associations
	has_many :messages
end
