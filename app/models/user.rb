class User < ApplicationRecord
  has_many :treasurers
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :parent_or_child, presence: true
  before_validation { email.downcase! }

  # enum parent_or_child: {親:1, 子供:2}

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
