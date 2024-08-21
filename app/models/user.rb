class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :bio, length: { maximum: 500 }

  has_one_attached :avatar
  has_many :rooms, dependent: :destroy
end
