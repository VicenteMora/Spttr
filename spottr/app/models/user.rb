class User < ActiveRecord::Base
	has_many :match_associations
	has_many :messages
	has_one :profile
	has_many :matches,  through: :match_associations 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        

def matchedUsers
       users = []
       self.matches.each do |match|
           new_User = ""
           if match.users[0] != self.id
               new_User = match.users[0]
           else
               new_User = match.users[1]
           end
           users.push(new_User)
       end
       return users
   end
end
