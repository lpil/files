require 'rails_helper'

feature 'UserAuthentications', :type => :feature do
  fixtures :users

  scenario 'User logs in and logs out' do
    louis = users :louis
    visit new_user_session_path
    fill_in 'Email', with: louis.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully.'
    expect(page).to have_content 'Login'
  end

  scenario 'New user signs up and logs out' do
    email    = 'tom@email.uk'
    password = 'password'

    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully.'
    expect(page).to have_content 'Login'
  end

  scenario 'Guest attempts to access restricted pages' do
    [users_path, user_path(users :louis), projects_path].each do |path|
      visit path
      expect(page).to have_content 'You need to sign in or sign up'
      expect(current_path).to eq new_user_session_path
    end
  end
end
