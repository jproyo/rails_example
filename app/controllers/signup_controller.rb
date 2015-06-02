class SignupController < ApplicationController
	skip_before_filter :secure_app
	layout "login"
	
	def index
	end

end
