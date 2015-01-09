require 'rails_helper'

feature "User updates their post" do
  before(:each) do
    @post = create(:post)
  end

  scenario "with valid information" do
    log_in(@post.user)

    visit post_path(@post)

    click_button "Edit"

    fill_in "post_title", with: "Updated title"
    fill_in "post_description", with: "Updated description"

    click_button "Update"
    
    expect(current_path).to eq(post_path(@post))
    expect(page).to have_content("Updated title")
  end

  scenario "with invalid information" do
    log_in(@post.user)

    visit post_path(@post)

    click_button "Edit"

    fill_in "post_title", with: nil
    fill_in "post_description", with: nil

    click_button "Update"

    expect(page).to have_content("The form contains 2 errors")
  end
end
