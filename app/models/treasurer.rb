class Treasurer < ApplicationRecord
  belongs_to :user
  belongs_to :management
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :category_id, :use_what, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :use_money, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :get_money, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
