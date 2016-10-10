require 'spec_helper'
require 'rails_helper'



feature "GET #new" do
  scenario "display new goal page" do
    sign_up_luke
    click_on "Add Goal"
    expect(page).to have_content("New Goal")
  end
end

feature "GET #show" do
  before(:each) do
    sign_up_luke
    click_on "Add Goal"
    fill_in "Title", with: "Gym"
    fill_in "Body", with: "2 hours"
    choose "Public"
    choose "Complete"
    click_on "Add Goal"
  end

  scenario "there is a link to the index" do
    expect(page).to have_content("All Goals")
  end

  scenario "there is a link to edit the goal" do
    expect(page).to have_content("Edit")
  end

  scenario "displays goal status" do
    expect(page).to have_content("Complete")
    expect(page).to have_content("Private")
  end

  scenario "comments are displayed"

  scenario "there are add and delete comment buttons"
end

feature "GET #index" do
  before(:each) do
    sign_up_luke
    click_on "Add Goal"
    fill_in "Title", with: "Gym"
    fill_in "Body", with: "2 hours"
    choose "Public"
    choose "Complete"
    click_on "Add Goal"
    click_on "All Goals"
  end
  scenario "display the goal title" do
    expect(page).to have_content("Gym")
  end
end

feature "GET #edit" do

end

feature "POST #create" do
  before(:each) do
  sign_up_luke
  end

  scenario "given valid input" do
    click_on "Add Goal"
    fill_in "Title", with: "Gym"
    fill_in "Body", with: "2 hours"
    choose "Public"
    choose "Complete"
    click_on "Add Goal"

    expect(page).to have_content("Gym")
  end

  scenario "given invalid input" do
    click_on "Add Goal"
    fill_in "Body", with: "2 hours"
    choose "Public"
    choose "Complete"
    click_on "Add Goal"

    expect(page).to have_content("Title can't be blank")
  end
end

feature "DELETE #destroy" do

end

feature "PATCH #update" do

end
