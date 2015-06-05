#encoding: UTF-8
module Api	
	class ItemsController < ApiBaseController


	  def list
  		@items = current_user.items
  		render json: @items
	  end

	  def create
  		new_item = Item.new(params).save
  		new_item.user = current_user
  		if new_item.save
  			render json: new_item
  		else
  			render json: {error: 'Could not store item'}, status: 409
  		end
	  end

	  def show
	  	@item = Item.find_by_id(params[:name])
	  	unless @item.nil?
	  		render json: @item
	  	else
	  		render json: {error: 'Not Found'}, status: 404
	  	end
	  end	  

	  def update
	  	@item = Item.find_by_id(params[:name])
	  	unless @item.nil?
	  		if @items.update(params)
	  			render json: @item
	  		else
	  			render json: {error: 'Could not be updated'}, status: 409
	  		end
	  	else
	  		render json: {error: 'Not Found'}, status: 404
	  	end
	  end	  

	  def delete
	  	unless Item.delete(params[:name])
	  		render status: 200
	  	else
	  		render json: {error: 'Not Found'}, status: 404
	  	end
	  end	  

	end
end