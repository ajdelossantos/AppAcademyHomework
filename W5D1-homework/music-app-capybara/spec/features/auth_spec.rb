require 'rails_helper'

# RSPEC    == Capybara
# describe == feature
# it       == scenario

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  #TODO study the implementation of these actions
  #IDEA notice they happen sequentially
  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      fill_in 'password', :with => "biscuits"
      click_on "Create User"
    end

    #TODO actual spec here
    #IDEA pattern here is front-end
    scenario "redirects to bands index page after signup" do
      # Belongs in controller...
      # expect(response).to redirect_to(bands_url)
      expect(current_path).to eq("/bands")
      expect(page).to have_content "Bands Index Page"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      click_on "create user"
    end

    #TODO actual spec here
    scenario "re-renders the signup page after failed signup" do
      expect(current_path).to eq("/users/new")
      expect(page).to have_content "Sign Up"
    end
  end

end
