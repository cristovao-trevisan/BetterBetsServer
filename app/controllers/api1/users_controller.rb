class Api1::UsersController < ApplicationController
	respond_to :json
#	force_ssl only: :create_bet	
	skip_before_filter  :verify_authenticity_token

	def bet_info
		user = User.find_by_facebook_id(params[:user])
		if user
			bets = (user.bets + user.dared_bets).uniq
			json = []
			bets.each_with_index do |bet, i|
				json[i] = {
					dared_user_id: bet.dared_user.facebook_id,
					start_date: bet.start_date.to_formatted_s(:db),
					end_date: bet.end_date.to_formatted_s(:db),
					description: bet.description ,
					prize: bet.prize,
					user_url: bet.user_url,
					dared_user_url: bet.dared_user_url 
				}
			end
			render json: json.to_json
		elsif
			user = {facebook_id: params[:user]}
			User.create!(user)
			render json: [].to_json
		else
			render json: "invalid request".to_json
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
			if User.find_by_facebook_id(params["user"]).nil?
				user = {facebook_id: params[:user]}
				User.create!(user)
			end
			if (JSON.parse(response.body)["id"] == params["user"])
				bet = params["bet"]
				bet["user_id"] = User.find_by_facebook_id(params["user"]).id
				bet["dared_user_id"] = User.find_by_facebook_id(params["dared_user"]).id
				if Bet.create bet_params(bet)
					render json: "ok".to_json
				else
					render json: "invalid bet".to_json
				end
			else
				render json: "invalid token or id".to_json
			end
		else
			render json: "invalid params".to_json
		end
	end
private
	def user_params(user)
		user.permit(:facebook_id)
	end
	def bet_params(bet)
    bet.permit(:user_id, :dared_user_id, :start_date, :end_date, :description, :prize, :user_url, :dared_user_url)
  end
end

