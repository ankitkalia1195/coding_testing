FactoryBot.define do
  factory :user do
    name "TestUser"
    password "password"

    trait :admin do
      is_admin true
    end
  end
end
