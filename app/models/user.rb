class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :profile, length: { maximum: 50 }
  validates :guitar_type, length: { maximum: 10 }
  validates :years_experience, length: { maximum: 2 }

  has_one_attached :user_img
end
