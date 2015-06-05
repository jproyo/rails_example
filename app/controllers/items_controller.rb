class ItemsController < ApplicationController
  def index
  	@items = []
  end

  def list
  	@items = current_user.items
  	render json: @items.to_json
  end
end
