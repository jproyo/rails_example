class SignupController < ApplicationController
	skip_before_filter :secure_app
	layout "login"
	
	def index
	end

	def create
		created = user_service.register
		if created 
			redirect_to items_path
		else
			flash.now[:danger] = t(:could_not_create_user)
			render :index
		end
	end

end
