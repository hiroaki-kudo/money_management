class User < ApplicationRecord
  # belongs_to :kid
  has_one :kid
  has_many :comments
  has_many :treasurers
  has_many :favorites, dependent: :destroy
  has_many :favorite_treasurers, through: :favorites, source: :treasurer
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # validates :parent_or_child, presence: true
  before_validation { email.downcase! }

  # enum parent_or_child: {親:1, 子供:2}
  accepts_nested_attributes_for :kid

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
