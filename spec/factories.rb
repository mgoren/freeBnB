FactoryGirl.define do
  factory(:user) do
    email('golem@golem.org')
    password('password')
  end

  factory(:listing) do
    title('hole in the ground')
    description('cozy hole in the ground')
    location('underground!')
  end

end
