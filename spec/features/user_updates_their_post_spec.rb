require 'rails_helper'

feature "user updates their post" do
  before(:each) do
    @user = create(:user)
    @post = create(:post)
    @post.user_id = @user.id
  end

  scenario "with valid information" do
    visit new_user_session_path
    fill_in "user_login", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Log in"

    visit post_path(@post)

    click_button "Edit"

    fill_in "post_title", with: "Updated title"
    fill_in "post_description", with: "Updated description"

    click_button "Update"
    
    expect(current_path).to eq(post_path(@post))
    expect(page).to have_content("Updated title")
  end
end
