require "rails_helper"

feature "visitor visits main page" do
  before(:each) do
    @user = create(:user)
  end

  scenario "not logged in" do
    visit "/"

    expect(page).to have_content("Sign in with Github")
  end

  scenario "logged in" do
    visit new_user_session_path

    fill_in "user_login", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
  end
end
