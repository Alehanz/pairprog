require 'rails_helper'

feature "User views profile page" do
  before(:each) do
    @user = create(:user)
    @user2 = create(:user)
  end

  scenario "their own" do
    log_in(@user)

    visit user_path(@user)

    expect(page).to have_link("Edit information")
    expect(page).to have_content(@user.username)
    expect(page).to have_content(@user.email)
  end

  scenario "someone else's" do
    log_in(@user)

    visit user_path(@user2)

    expect(page).not_to have_content("Edit information")
    expect(page).to have_content(@user2.username)
    expect(page).to have_content(@user2.email)
  end

  scenario "should not see any profile if not logged in" do
    visit user_path(@user)

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content("You need to sign in or sign up")
  end

end
