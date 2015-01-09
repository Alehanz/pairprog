require "rails_helper"

describe "User signs up" do
  scenario "with valid information" do
    visit "/"
    click_link "Sign up"

    fill_in "user_username", with: "Username"
    fill_in "user_email", with: "testing@example.com"
    fill_in "user_password", with: "foobaroo"
    fill_in "user_password_confirmation", with: "foobaroo"

    click_button "Create User"

    expect(page).to have_content("You have signed up successfully")
  end

  scenario "with invalid information" do
    visit "/"
    click_link "Sign up"

    fill_in "user_username", with: nil
    fill_in "user_email", with: nil
    fill_in "user_password", with: "foobar"
    fill_in "user_password_confirmation", with: "foobar"

    click_button "Create User"

    expect(page).to have_content("2 errors prohibited this user from being saved")
  end
end
