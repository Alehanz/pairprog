require "rails_helper"

feature "User comments on post" do
  before(:each) do
    @user = create(:user)
    @user2 = create(:user)
    @post = create(:post)
    @post.user_id = @user.id
  end

  scenario "User can see the add comment button" do
    log_in(@user)
    visit post_path(@post)

    expect(page).to have_button "Add Comment"
  end

  scenario "User can see the add comment text field" do
    log_in(@user)
    visit post_path(@post)

    expect(page).to have_css("textarea.form-control.bootsy_text_area")
  end

  scenario "User can add comment with valid info" do
    log_in(@user)
    visit post_path(@post)

    fill_in "comment_comment_body", with: "Test comment"
    click_button "Add Comment"

    expect(page).to have_content("Test comment")
  end

  scenario "User can't add comment with more than 3000 characters" do
    log_in(@user)
    visit post_path(@post)

    fill_in "comment_comment_body", with: ("x" * 3001)
    click_button "Add Comment"

    expect(page).to have_content("Comment body is too long")
  end

  scenario "User can't add comment with an empty body" do
    log_in(@user)
    visit post_path(@post)

    fill_in "comment_comment_body", with: nil
    click_button "Add Comment"

    expect(page).to have_content("Comment body can't be blank")
  end

  scenario "User can delete their comment" do
    log_in(@user)
    visit post_path(@post)
    fill_in "comment_comment_body", with: "Test comment"
    click_button "Add Comment"

    click_link "Delete"

    expect(page).to have_content("Comment deleted!")
  end

  scenario "User can't delete others comments" do
    log_in(@user2)
    visit post_path(@post)
    fill_in "comment_comment_body", with: "Test comment"
    click_button "Add Comment"
    click_link "Log out"

    log_in(@user)
    visit post_path(@post)

    expect(page).to have_content("Test comment")
    expect(page).not_to have_link "Delete"
  end

  scenario "User can edit their comment" do
    log_in(@user)
    visit post_path(@post)
    fill_in "comment_comment_body", with: "Test comment"
    click_button "Add Comment"

    click_link "Edit"

    expect(page).to have_content("Update Comment")
  end
end
