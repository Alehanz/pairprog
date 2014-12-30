require "rails_helper"

feature "user creates new post" do
  before(:each) do
    @user = create(:user)
  end

  scenario "with valid information" do
    log_in(@user)
    visit posts_path

    click_button "New Post"
    fill_in "post_title", with: "Rails store"
    fill_in "post_description", with: "Description"
    click_button "Create Post"

    expect(page).to have_content("Rails store")
  end

  scenario "with invalid information" do
    log_in(@user)
    visit posts_path

    click_button "New Post"
    click_button "Create Post"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")

  end
end
