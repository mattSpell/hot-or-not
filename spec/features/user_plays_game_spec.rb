feature "user plays the game" do
  let!(:home1){ Fabricate(:home) }
  let!(:home2){ Fabricate(:home,
    photo_url: "http://photos1.zillowstatic.com/p_g/IS1jju3rxsihnx1000000000.jpg",
    list_price: "$410,000", address: "1510 Demonbreun St #510, Nashville, TN 37203",
    description: "1 bed, 1 bath, 1,000 sqft") }
  let!(:home3){ Fabricate(:home,
    photo_url: "http://TEST.jpg",
    list_price: "$210,000", address: "1510 Demonbreun St #510, Nashville, TN 37203",
    description: "1 bed, 1 bath, 1,000 sqft") }

  scenario "user views the first home" do
    sign_into_facebook_as "joe"
    visit '/'
    click_on "facebook"
    click_on "Play"
    expect(page).to have_css("img.thumbnail")
    expect(page).to have_css("h3.list-price")
    expect(page).to have_css("p.address")
    expect(page).to have_css("p.desc")
  end
end
