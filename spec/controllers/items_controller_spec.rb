require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

	def init_items
		user = User.create!(username: "User 1", password: "xxxx")
  	10.times do |i|
  		Item.create!(link: "http://youtube.com/SDfafdaf#{i}", link_type: (i%2==0?"Youtube":"Image"), description: "My description #{i}", user: user)
  	end
  	user.id
	end

  describe "Unauthenticated" do
    it "redirect to login page for unauthenticated user" do
      get :index
      response.should have_http_status(302)
    end
  end

  describe "GET #index" do

    before(:each) do
      controller.stub(:current_user).and_return(User.new)
    end


    it "returns list of items for an user" do
    	user_id = init_items
      get :index
      response.should be_success
      response.should have_http_status(200)
    end
  end

end
