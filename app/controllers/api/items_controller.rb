#encoding: UTF-8
module Api	
	class ItemsController < ApiBaseController
	  def list
  		@items = current_user.items
  		render json: ["hello"].to_json
	  end
	end
end