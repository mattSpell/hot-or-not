require 'rails_helper'

feature "User Authentication" do
  # - As a user,
  # I want the ability to sign in with facebook or twitter
  # In order to play the game.
  # Acceptance Criteria:
  # Able to click link to login with facebook or twitter
  # User account should be saved in Database

  scenario "Sign In with Facebook" do
    sign_into_facebook_as "joe"
    visit '/'
    click_link "Sign In with Facebook"
    expect(page).to have_content "Successfully authenticated from Facebook account."
    expect(page).to have_content "Sign Out"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    click_link "Sign Out"
    expect(page).not_to have_content "Sign Out"
    expect(page).to have_content "Sign In with Facebook"
    expect(User.count).to eq 1
  end

  scenario "Login and Log out with Facebook" do
    Fabricate(:user,
      uid: "12345",
      email: "joe@example.com",
      name: "joe")
    sign_into_facebook_as "joe"
    visit '/'
    click_link "Sign In with Facebook"
    expect(page).to have_content "Successfully authenticated from Facebook account."

    expect(page).to have_content "Sign Out"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    click_link "Sign Out"
    expect(page).not_to have_content "Sign Out"
    expect(page).to have_content "Sign In with Facebook"
    expect(User.count).to eq 2
  end

end
