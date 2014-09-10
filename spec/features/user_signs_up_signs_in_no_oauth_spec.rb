# - As a user,
# I want the ability to create a new account
# In order to play the game.
# Acceptance Criteria:
# Able to input email, and password.
# Validate that email and password are present.
# Password should be encrypted in Database.
# User account should be saved in Database

feature "Users signs up and signs in with regular email address and password" do
  scenario "Happy Path, Sign Up and subsequent Sign In" do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "matt@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Sign up"
    current_path.should == root_path
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "Signed in as: matt@example.com"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"

    click_link "Sign Out"
    current_path.should == root_path
    expect(page).to have_content "Signed out successfully."
    click_link "Sign In"

    fill_in "Email", with: "matt@example.com"
    fill_in "Password", with: "password1"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  scenario "Skipped email and password" do
    visit '/'
    click_link "Sign Up"
    click_button "Sign up"
    expect(page).to have_content "4 errors prohibited this user from being saved:"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
