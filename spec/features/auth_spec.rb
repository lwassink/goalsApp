require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit(new_user_path)
    expect(page).to have_content("Sign Up")
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      sign_up_luke
      expect(page).to have_content("Luke")
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    sign_up_luke
    visit goals_url
    expect(page).to have_content("Luke")
  end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    sign_up_luke
    click_on "Log Out"
    expect(page).to have_content("Sign In")
  end

  scenario "doesn't show username on the homepage after logout" do
    sign_up_luke
    click_on "Log Out"
    expect(page).not_to have_content("Luke")
  end

end
