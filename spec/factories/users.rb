FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password Faker::Internet.password(12)
    sequence(:email) {|n| "bidder_#{n}@biddr.com"}    
  end

end
