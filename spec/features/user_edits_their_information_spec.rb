require 'rails_helper'

feature "User edits their information" do
  before(:each) do
    @user = create(:user)
  end

  scenario "with valid info" do
    log_in(@user)

    visit user_path(@user)

    click_link "Edit information"

    fill_in "Username", with: "Updated"
    fill_in "Email", with: "update@example.com"
    fill_in "Password", with: "updatedpassword"
    fill_in "Password confirmation", with: "updatedpassword"
    fill_in "Current password", with: @user.password

    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully")
  end

  scenario "with invalid info" do
    log_in(@user)

    visit user_path(@user)

    click_link "Edit information"

    fill_in "Email", with: nil

    click_button "Update"

    expect(page).to have_content("Email can't be blank")
  end
end
