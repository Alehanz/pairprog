require "rails_helper"

feature "user can see posts once logged in" do
  before(:each) do
    @user = create(:user)
    @post1 = create(:post)
    @post2 = create(:post)
  end

  scenario "user sees all posts after logging in" do
    log_in(@user)
    visit posts_path

    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
  end

  scenario "user views a particular post and its description" do
    log_in(@user)
    visit posts_path
    click_link "#{@post1.title}"

    expect(page).to have_content(@post1.description)
  end
 end
