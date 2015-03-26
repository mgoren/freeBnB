require 'rails_helper'

describe 'the requesting a stay process' do
  it "will allow a user to send a Request to another user" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: 'foo@me.com')
    listing = FactoryGirl.create(:listing)
    user2.listings.push(listing)
    login(user)
    click_link listing.title
    click_on 'Request a Stay'
    expect(page).to have_content "Send a request"
  end

  it "will successfully send a request" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: 'foo@me.com')
    listing = FactoryGirl.create(:listing)
    user2.listings.push(listing)
    login(user)
    click_link listing.title
    click_on 'Request a Stay'
    fill_in "Title", with: "PLEASE"
    fill_in "Body", with: "can i stay there?"
    click_on "Send Request"
    expect(page).to have_content "Your request was sent!"
  end
end
