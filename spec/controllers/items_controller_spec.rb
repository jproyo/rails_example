require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  fixtures :users

  describe "Unauthenticated" do
    it "redirect to login page for unauthenticated user" do
      get :index
      assert_redirected_to login_path
    end
  end

  describe "GET #index" do

    before(:each) do
      expect(controller).to receive(:current_user).twice.and_return(users(:useritems))
    end


    it "returns list of items for an user" do
      get :index
      assert_response :success
      assert_template 'items/index'
      items = assigns(:items)
      refute items.nil?
      assert_equal items.size, 4
    end
  end

end
