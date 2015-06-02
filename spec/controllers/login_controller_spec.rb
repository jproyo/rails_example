require 'rails_helper'

RSpec.describe LoginController, type: :controller do

	describe "GET #login index" do
    it "go to login page" do
      get :index
      response.should be_success
      response.should have_http_status(200)
    end

    it "login with unexisting user" do
      get :index
      assert_template 'login/index'
			post :create, login: { email: 'unknown_user@test.com', password: 'mypass123' }
			assert_template 'login/index'
			refute flash.empty?
			assert_equal flash.now[:notice], 'User is not registered. Please click in Signup link'
    end    
  end


end
