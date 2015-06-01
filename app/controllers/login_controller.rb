class LoginController < ApplicationController
	skip_before_filter :secure_app
	def index
	end

	def create
 		user = User.find_by(username: params[:login][:email].downcase)
    if user && user.authenticate(params[:login][:password])
    	add_user user
    	redirect_to @items
    else
    	flash[:danger] = 'Invalid email/password combination'
			render :index
		end
	end

	def new
		puts params
		render :index
	end	
end
