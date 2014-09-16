feature "user plays the game" do
  let!(:home){ Fabricate(:home, photo_url: "http://photos1.zillowstatic.com/p_g/IS1jju3rxsihnx1000000000.jpg", list_price: "$410,000", address: "1510 Demonbreun St #510, Nashville, TN 37203", description: "1 bed, 1 bath, 1,000 sqft") }
  scenario "success" do
    sign_into_facebook_as "joe"
    visit '/'
    click_on "facebook"
    click_on "Play"
    expect(page).to have_css("img.thumbnail")
    

  end
end