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
			assert_equal flash.now[:danger], 'Invalid email/password combination'
    end

    it "login with empty parameters" do
      get :index
      assert_template 'login/index'
      post :create, login: { email: '', password: '' }
      assert_template 'login/index'
      refute flash.empty?
      assert_equal flash.now[:danger], 'Invalid email/password combination'
    end

    it "login with invalid email parameters" do
      get :index
      assert_template 'login/index'
      post :create, login: { email: 'sdfsdf', password: '' }
      assert_template 'login/index'
      refute flash.empty?
      assert_equal flash.now[:danger], 'Invalid email/password combination'
    end

    it "login with invalid password parameters" do
      get :index
      assert_template 'login/index'
      user_prelogged = users(:prelogged)
      post :create, login: { email: user_prelogged.username, password: 'abc' }
      assert_template 'login/index'
      refute flash.empty?
      assert_equal flash.now[:danger], 'Invalid email/password combination'
    end

    it "login with existing user successfully" do
      get :index
      assert_template 'login/index'
      user_prelogged = users(:prelogged)
      post :create, login: { email: user_prelogged.username, password: 'mypassword123' }
      assert flash.empty?
      assert_redirected_to items_path
    end 

    it "login with existing user wrong password" do
      get :index
      assert_template 'login/index'
      user_prelogged = users(:prelogged)
      post :create, login: { email: user_prelogged.username, password: 'mypassword13' }
      assert_template 'login/index'
      refute flash.empty?
      assert_equal flash.now[:danger], 'Invalid email/password combination'
    end 
   
  end    

end
