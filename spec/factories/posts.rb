FactoryBot.define do
  factory :post do
    user_id { 1 }
    title { "音階練習" }
    content { "ドレミファソラシドを低いドから高いドまで順番に弾いてみましょう。" }
    category { "クラシック" }
    youtube_url { "NSuiLcamM5s" }
    association :user
  end
end
