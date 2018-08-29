FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@test.com" }
    password "password"
    confirmed_at Time.now - 100
  end

  trait :admin do
    role "admin"
  end
end
