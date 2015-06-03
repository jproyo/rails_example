class LoginController < ApplicationController

	skip_before_filter :secure_app
	def index
	end

	def destroy
		session.destroy
		redirect_to root_path
	end

	def create
		user, result = user_service.login
		unless user.nil?
			add_user user
			redirect_to items_path
		else
			flash.now[:danger] = t(result)
 			render :index
		end
	end

end
