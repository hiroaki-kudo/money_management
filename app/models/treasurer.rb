class Treasurer < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :category_id, :use_what, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
