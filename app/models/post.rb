class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 250 }
  validates :category, inclusion: { in: ["クラシック", "ロック", "ポップス", "ジャズ", "その他"] }
  validates :tag, presence: true

  def self.search(search)
    return Post.all unless search
    Post.where("title LIKE(?)", "%#{search}%").or(where("category LIKE(?)", "%#{search}%"))
  end
end
