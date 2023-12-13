class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 250 }
  validates :category, inclusion: { in: ["クラシック", "ロック", "ポップス", "ジャズ", "その他"] }
end
