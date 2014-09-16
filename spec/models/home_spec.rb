require 'rails_helper'

RSpec.describe Home, :type => :model do
  it { should have_many :viewed_homes }

  describe "get_next_home" do
    let!(:user){ Fabricate(:user) }
    let!(:home1){ Fabricate(:home) }
    let!(:home2){ Fabricate(:home, photo_url: "http://photos1.zillowstatic.com/p_g/IS1jju3rxsihnx1000000000.jpg", list_price: "$410,000", address: "1510 Demonbreun St #510, Nashville, TN 37203", description: "1 bed, 1 bath, 1,000 sqft") }

    it "should get a home that hasn't been viewed yet" do
      Home.get_next_home(user)
      expect(ViewedHome.count).to eq 1
      expect(ViewedHome.last.home_id).to eq home2.id
    end

  end
end
