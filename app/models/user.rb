class User < ApplicationRecord
  has_many :managements, foreign_key: :kid_id, dependent: :destroy
  has_many :managements, foreign_key: :parent_id
  has_many :comments
  has_many :treasurers
  has_many :favorites, dependent: :destroy
  has_many :favorite_treasurers, through: :favorites, source: :treasurer
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }

  # enum parent_or_child: {親:1, 子供:2}
  accepts_nested_attributes_for :managements, allow_destroy: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
