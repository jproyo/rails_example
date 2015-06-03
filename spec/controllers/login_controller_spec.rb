require 'rails_helper'

RSpec.describe LoginController, type: :controller do

  fixtures :users

	describe "GET #login" do
    it "go to login page" do
      get :index
      response.should be_success
      response.should have_http_status(200)
    end

       
  end

  describe "POST #login" do
    it "login with unexisting user" do
      get :index
      assert_template 'login/index'
			post :create, login: { email: 'unknown_user@test.com', password: 'mypass123' }
			assert_template 'login/index'
			refute flash.empty?
			assert_equal flash.now[:notice], 'User is not registered. Please click in Signup link'
    end


    it "login with existing user successfully" do
      get :index
      assert_template 'login/index'
      user_prelogged = users(:prelogged)
      post :create, login: { email: user_prelogged.username, password: 'mypassword123' }
      assert flash.empty?
      assert_redirected_to items_path
    end 
  end    

end
