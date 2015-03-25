require 'rails_helper'

describe "the creating a new listing process" do
  it "will add a new listing" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link('Add listing')
    fill_in 'Title', with: 'hole in ground'
    fill_in 'Description', with: 'cozy hole in ground'
    fill_in 'Location', with: 'deep'
    click_button 'Create Listing'
    expect(page).to have_content 'Listing added!'
  end
  it "will not add a new listing without all info" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link('Add listing')
    fill_in 'Title', with: 'hole in ground'
    fill_in 'Description', with: 'cozy hole in ground'
    click_button 'Create Listing'
    expect(page).to have_content 'Listing not created. ):'
  end
end

describe "viewing a listing" do
  it "will view a single listing" do
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing)
    user.listings.push(listing)
    visit listings_path
    click_link listing.title
    expect(page).to have_content listing.description
  end
end

describe "editing a listing" do
  it "will allow a logged in user to edit one of their listings" do
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing)
    user.listings.push(listing)
    login(user)
    visit listings_path
    click_link listing.title
    click_link 'edit listing'
    fill_in 'Title', :with => "Hole in le Earth"
    click_on "Update Listing"
    expect(page).to have_content "Listing updated."
  end
end
