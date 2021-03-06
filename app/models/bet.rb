class Bet < ActiveRecord::Base
	belongs_to :user
	belongs_to :dared_user, class_name: 'User'

	validates_presence_of	:user
	validates_presence_of	:dared_user
	validates_presence_of	:start_date
	validates_presence_of	:end_date	
	validates_presence_of	:user_url
	validates_presence_of	:dared_user_url
end
