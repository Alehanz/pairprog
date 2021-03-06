require "rails_helper"

feature "User signs out" do
  scenario "gets redirected to root_path" do
    user = create(:user)
    visit new_user_session_path
    fill_in "user_login", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"

    click_link "Log out"

    expect(current_path).to eq "/"
  end
end
