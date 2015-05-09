FactoryGirl.define do
  factory :auction do
    association :user, factory: :user
    title Faker::Company.bs
    details Faker::Lorem.paragraph
    reserve_price 500
    current_price 10
  end

end
