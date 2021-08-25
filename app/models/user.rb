class User < ApplicationRecord
  has_many :managements, foreign_key: :kid_id, dependent: :destroy
  has_many :managements, foreign_key: :parent_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :treasurers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_treasurers, through: :favorites, source: :treasurer
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  accepts_nested_attributes_for :managements, allow_destroy: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.guest
    find_or_create_by!(email: 'guest@guest.com') do |user|
      user.name = 'ゲストユーザ(子)'
      user.password = SecureRandom.urlsafe_base64
    end
  end
  def self.parent_guest
    find_or_create_by!(email: 'haha@haha.com') do |user|
      user.name = 'ゲストユーザ(親)'
      user.password = SecureRandom.urlsafe_base64
    end
  end
  def self.admin_guest
    find_or_create_by!(email: 'kanri@kanri.com') do |user|
      user.name = '管理者ユーザ'
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
