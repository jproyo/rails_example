#encoding: UTF-8
class ApiBaseController < ApplicationController

	skip_before_filter :secure_app

	before_filter :api_secure

	def api_secure
		authenticate_or_request_with_http_token do |token, options|
			token == Rails.application.config.api_resource_secret
		end
		render json: {error: 'User could not be detected'}, status: 401 if current_user.nil?
	end


end