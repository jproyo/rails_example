require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  fixtures :items, :users

  describe "Unauthenticated" do
    it "redirect to login page for unauthenticated user" do
      get :index
      assert_redirected_to login_path
    end
  end

  describe "GET #index" do

    before(:each) do
      controller.stub(:current_user).and_return(users(:useritems))
    end


    it "returns list of items for an user" do
      get :list
      assert_response :success
      body_response = JSON.parse(response.body)
      refute body_response.nil?
      assert_equal body_response.size, 4
    end
  end

end
