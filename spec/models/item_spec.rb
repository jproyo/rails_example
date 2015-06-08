require 'rails_helper'

RSpec.describe Item, type: :model do

  fixtures :users
  
  it "allows create items for an user" do
    user = User.create!(username: "username@test.com", password: "mypass123")
  	item = Item.create!(link: "http://youtube.com/SDfafdaf", link_type: "Youtube", description: "My weeding video", user: user)

		expect(User.find_by(username: user.username).items.first).to eq(item)
	end

  it "allows create multiple items for an user" do
    user = User.create!(username: "username@test.com", password: "mypass123")
  	10.times do |i|
  		Item.create!(link: "http://youtube.com/SDfafdaf#{i}", link_type: (i%2==0?"Youtube":"Image"), description: "My description #{i}", user: user)
  	end

		expect(User.find_by(username: user.username).items.size).to eq(10)
	end
end
