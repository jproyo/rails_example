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
      get :index
      assert_template 'items/index'
      assert_response :success
      items = assigns(:items)
      refute_nil items
      refute items.empty?
      assert_equal items.size, 4
    end
  end

end
