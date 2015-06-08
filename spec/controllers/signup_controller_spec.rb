require 'rails_helper'

RSpec.describe SignupController, type: :controller do

 	describe "GET #signup" do

    it "go to signup page" do
      get :index
      assert_template 'signup/index'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "go to signup page and fill up form success" do
      get :index
      assert_template 'signup/index'
			post :create, signup: { username: 'unknown_user@test.com', password: 'mypass123' }
			assert_redirected_to items_path
    end    

    it "go to signup page and fill up form fail" do
      get :index
      assert_template 'signup/index'
			allow_any_instance_of(User).to receive(:save).and_return(false)
			post :create, signup: { username: 'unknown_user@test.com', password: 'mypass123' }
			assert_template 'signup/index'
			refute flash.empty?
			assert_equal flash.now[:danger], 'Could not register user'
    end    

  end

end
