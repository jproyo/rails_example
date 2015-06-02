class SignupController < ApplicationController
	skip_before_filter :secure_app
	layout "login"
	
	def index
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash.now[:notice] = "User has been created successfully"
		else
			flash.now[:danger] = "Could not create user"
		end
		render :index
	end

	def user_params
    params.require(:signup).permit(:username, :password)
  end

end
