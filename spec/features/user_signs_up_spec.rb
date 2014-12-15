require 'rails_helper'

describe 'user signs up' do
  scenario 'with valid information' do
    visit '/'
    click_link 'Sign up'

    fill_in 'user_email', with: 'test@example.com'
    fill_in 'user_password', with: 'foobaroo'
    fill_in 'user_password_confirmation', with: 'foobaroo'

    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully')
  end

  scenario 'with invalid information' do
    visit '/'
    click_link 'Sign up'

    fill_in 'user_email', with: nil
    fill_in 'user_password', with: 'foobar'
    fill_in 'user_password_confirmation', with: 'foobar'

    click_button 'Sign up'

    expect(page).to have_content('2 errors prohibited this user from being saved')
  end
end
