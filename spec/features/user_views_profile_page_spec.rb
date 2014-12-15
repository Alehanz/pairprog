require 'rails_helper'

feature "user views profile page" do
  before(:each) do
    @user = create(:user)
  end
  scenario "their own" do
    log_in(@user)

    visit user_path(@user)

    expect(page).to have_content("Edit information")
  end
end
