FactoryGirl.define do
  factory(:user) do
    email('golem@golem.org')
    password('password')
  end
end
