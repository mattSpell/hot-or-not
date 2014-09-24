require 'rails_helper'

RSpec.describe Home, :type => :model do
  it { should have_many :viewed_homes }
  it { should validate_uniqueness_of :photo_url }

  let!(:user){ Fabricate(:user) }
  let!(:home1){ Fabricate(:home) }
  let!(:viewed_home){ Fabricate(:viewed_home, home_id: home1.id, user_id: user.id, favorite: true) }
  let!(:home2){ Fabricate(:home,
    photo_url: "http://photos1.zillowstatic.com/p_g/IS1jju3rxsihnx1000000000.jpg",
    list_price: "$410,000", address: "1510 Demonbreun St #510, Nashville, TN 37203",
    description: "1 bed, 1 bath, 1,000 sqft") }
  let!(:home3){ Fabricate(:home,
    photo_url: "http://THISISATEST.jpg",
    list_price: "$999,000", address: "111 March Street, Nashville, TN 37777",
    description: "5 beds, 6 baths, 10,000 sqft") }

  describe "update_home" do
    it "should correctly update the viewed_homes table" do
      expect(ViewedHome.count).to eq 1
      Home.update_home(user, true, home1.id)
      expect(ViewedHome.count).to eq 2
      expect(ViewedHome.last.home_id).to eq home1.id
      expect(ViewedHome.last.user_id).to eq user.id
      expect(ViewedHome.last.favorite).to eq true
    end
  end

  describe "get_next_home" do
    it "should get the next unseen home" do
      test_home = Home.get_next_home(user)
      expect(test_home.id).not_to eq viewed_home.id
    end
  end

  describe "get_unseen_homes" do
    it "should get all unseen homes" do
      unseen_homes = Home.get_unseen_homes(user)
      expect(unseen_homes.count).to eq 2
      Home.update_home(user, true, home2.id)
      unseen_homes = Home.get_unseen_homes(user)
      expect(unseen_homes.count).to eq 1
      expect(unseen_homes).to include(home3)
    end
  end

  describe "get_favorites" do
    it "should get all the users favorites" do
      favs = Home.get_favorites(user)
      expect(favs.count).to eq 1
      Home.update_home(user, true, home1.id)
      favs = Home.get_favorites(user)
      expect(favs.count).to eq 2
    end
  end

end
