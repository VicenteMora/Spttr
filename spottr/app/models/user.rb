class User < ActiveRecord::Base
	has_many :match_associations
	has_many :messages
	has_one :profile
	has_many :matches,  through: :match_associations 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
