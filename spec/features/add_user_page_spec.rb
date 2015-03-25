require 'rails_helper'

describe "the creating a new user process" do
  it "will add a new user" do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Username', with: 'foo'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create User'
    expect(page).to have_content 'Account created!'
  end
end
