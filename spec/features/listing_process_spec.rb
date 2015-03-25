require 'rails_helper'

describe "the creating a new listing process" do
  it "will add a new listing" do
    visit '/'
    login(user)
    fill_in 'Email', with: 'foo@foo.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
