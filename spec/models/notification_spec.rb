require 'rails_helper'

describe Notification do
  it {should belong_to :user}
  it {should validate_presence_of :title }
  it {should validate_presence_of :body }

end
