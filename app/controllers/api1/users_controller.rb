class Api1::UsersController < ApplicationController
	respond_to :json
#	force_ssl only: :create_bet	
	skip_before_filter  :verify_authenticity_token

	def bet_info
		user = User.find_by_email(params[:user])
		if user
			render json: (user.bets + user.dared_bets).uniq.to_json
		else
			render json: "invalid user".to_json
		end
	end

	def create_bet
		facebook_token = params[:facebook_token]
		if facebook_token
			uri = URI.parse('https://graph.facebook.com/me?fields=id&access_token='+facebook_token)
			response = nil;
			Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
				request = Net::HTTP::Get.new uri
				response = http.request request # Net::HTTPResponse object
			end
			if JSON.parse(response.body)["id"]
				bet = params["bet"]
				bet["user_id"] = User.find_by_email(params["user"]).id
				bet["dared_user_id"] = User.find_by_email(params["dared_user"]).id
				if Bet.create bet_params(bet)
					render json: "ok".to_json
				else
					render json: "invalid bet".to_json
				end
			else
				render json: "invalid token".to_json
			end
		else
			render json: "invalid params".to_json
		end
	end
private
	def bet_params(bet)
    bet.permit(:user_id, :dared_user_id, :start_date, :end_date, :description, :prize, :user_url, :dared_user_url)
  end
end

