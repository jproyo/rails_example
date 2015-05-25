class LoginController < ApplicationController
	skip_before_filter :secure_app
	def index
	end
end
