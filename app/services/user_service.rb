#encoding: UTF-8
class UserService

	attr_accessor :params

	def initialize(data={})
		@params = data
	end

	def login
 		user = User.find_by(username: params[:login][:email].downcase)
 		return [user,:success] unless user.nil? or !user.authenticate(params[:login][:password])
 		[nil,:invalid_user_or_password]
	end

end