FactoryBot.define do
  factory :user do
    username { "test_user" }
    sequence(:email) { |n| "test_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    guitar_type { "エレキギター" }
    years_experience { "3年" }
    category { "ロック" }
  end
end
