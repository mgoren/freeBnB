require 'rails_helper'

describe User do
  it {should have_many :listings}
  it {should have_many :notifications}
  it { should have_many(:requesters).class_name('User').through(:notifications) }

end
