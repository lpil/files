require 'rails_helper'

feature 'Projects', :type => :feature do
  fixtures :users, :projects

  let!(:user) { users(:louis) }

  before :each do
    login_as(user, :scope => :user)
  end

  scenario 'User creates new project' do
    visit new_project_path
    fill_in 'Name', with: 'Our new project'
    click_button 'Create Project'
    expect(page).to have_content 'Created project'
  end

  scenario 'User edits a project' do
    new_project_name = 'New project name'

    visit project_path projects(:one)
    click_link 'Edit'
    fill_in 'Name', with: new_project_name
    click_button 'Update'
    expect(page).to have_content 'successfully updated'
    expect(page).to have_content new_project_name
  end
end
