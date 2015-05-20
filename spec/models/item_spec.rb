require 'rails_helper'

RSpec.describe Item, type: :model do
  
  it "allows create items for an user" do
  	user = User.create!(username: "User 1", password: "xxxx")
  	item = Item.create!(link: "http://youtube.com/SDfafdaf", link_type: "Youtube", description: "My weeding video", user: user)

		expect(Item.find_by_user_id(user.id)).to eq(item)
	end

  it "allows create multiple items for an user" do
  	user = User.create!(username: "User 1", password: "xxxx")
  	10.times do |i|
  		Item.create!(link: "http://youtube.com/SDfafdaf#{i}", link_type: (i%2==0?"Youtube":"Image"), description: "My description #{i}", user: user)
  	end

		expect(User.find_by_username("User 1").items.size).to eq(10)
	end
end
