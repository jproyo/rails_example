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
			post :create, login: { email: 'unknown_user@test.com', password: 'password' }
			assert_template 'login/index'
			refute flash.empty?
			assert_equal flash.now[:notice], 'User is not registered. Please click in Signup link'
    end    
  end

 	describe "GET #signup" do
    it "go to signup page" do
      get :signup
      assert_template 'login/new'
      response.should be_success
      response.should have_http_status(200)
    end

    it "go to signup page and fill up form" do
      get :signup
      assert_template 'login/new'
			post :signup, signup: { email: 'unknown_user@test.com', password: 'password' }
			assert_template 'login/signup'
			refute flash.empty?
    end    
  end

end
