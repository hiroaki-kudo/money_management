class Treasurer < ApplicationRecord
  belongs_to :user
  belongs_to :management
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :category_id, :use_what, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :use_money, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 99999}
  validates :get_money, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 99999}
end
