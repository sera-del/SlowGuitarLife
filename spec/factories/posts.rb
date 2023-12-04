FactoryBot.define do
  factory :post do
    user_id { 1 }
    title { "MyString" }
    content { "MyText" }
    tag { "MyString" }
  end
end
