class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: "sample@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲスト"
    end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  validates :username, presence: true
  validates :profile, length: { maximum: 50 }
  validates :guitar_type, length: { maximum: 10 }

  has_one_attached :user_img
end
