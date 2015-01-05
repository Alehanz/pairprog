require "rails_helper"

feature "User signs in" do
  before(:each) do
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = {
      :provider => "github",
      :uid => "1234567",
      :credentials => {
        :token=> "3nkjnie"
      },
      :info => {
        :nickname => "test",
        :email => "info@gmail.com",
        :name => "Test User",
        :first_name => "Test",
        :last_name => "User",
        :location => "California",
        :verified => true
      }.stringify_keys!
    }.stringify_keys!
  end

  scenario "with site's login and password" do
    user = create(:user)
    log_in(user)

    expect(page).to have_content("Signed in successfully")
  end

  scenario "with github" do
    visit "/"

    click_link "Sign in with Github"
    expect(page).to have_content("Successfully authenticated from Github account")
  end
end
