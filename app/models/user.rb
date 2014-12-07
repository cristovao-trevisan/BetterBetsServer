class User < ActiveRecord::Base
	has_many :bets
	has_many :dared_bets, class_name: 'Bet', foreign_key: 'dared_user_id'

	validates :email, presence: true, uniqueness: true
end
