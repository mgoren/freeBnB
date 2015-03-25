require 'rails_helper'

describe Listing do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
end
