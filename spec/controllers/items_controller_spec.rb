require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

	def init_items
		user = User.create!(username: "User 1", password: "xxxx")
  	10.times do |i|
  		Item.create!(link: "http://youtube.com/SDfafdaf#{i}", link_type: (i%2==0?"Youtube":"Image"), description: "My description #{i}", user: user)
  	end
  	user.id
	end

  describe "GET #index" do
    it "returns list of items for an user" do
    	user_id = init_items
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
